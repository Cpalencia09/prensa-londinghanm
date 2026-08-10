<#
    reemplazar-dominio.ps1
    ----------------------
    Cambia el dominio de las URLs canonicas, Open Graph, JSON-LD y sitemap
    en los 20 articulos, el index, el sitemap.xml y el robots.txt.

    Detecta solo el dominio que tienen ahora las paginas, asi que sirve tanto la
    primera vez (marcador TU-DOMINIO) como para migrar de un dominio a otro.

    USO
      Ver que dominio tienen ahora las paginas:
      .\reemplazar-dominio.ps1 -Detectar

      Cambiar al dominio real:
      .\reemplazar-dominio.ps1 -Dominio "https://www.elportalreal.com"

      Forzar el dominio de origen (si la deteccion falla):
      .\reemplazar-dominio.ps1 -Actual "https://viejo.com" -Dominio "https://nuevo.com"

      Solo un articulo concreto:
      .\reemplazar-dominio.ps1 -Dominio "https://www.elportalreal.com" -Archivos "articulo-07.html"

      Ver que cambiaria sin tocar nada:
      .\reemplazar-dominio.ps1 -Dominio "https://www.elportalreal.com" -Simular

    NOTA: lee y escribe siempre en UTF-8 sin BOM. No uses Get-Content/Set-Content
    a secas sobre estos archivos: en Windows PowerShell 5.1 rompen los acentos.
#>

[CmdletBinding()]
param(
    [string]$Dominio,

    [string]$Actual,

    [string[]]$Archivos,

    [switch]$Simular,

    [switch]$Detectar
)

$ErrorActionPreference = 'Stop'

$raiz = Split-Path -Parent $MyInvocation.MyCommand.Path
$utf8 = New-Object System.Text.UTF8Encoding($false)

# Lee el canonical del articulo 01 para saber que dominio tienen ahora las paginas
function Get-DominioActual {
    $ref = Join-Path $raiz 'articulo-01.html'
    if (-not (Test-Path $ref)) { return $null }
    $t = [System.IO.File]::ReadAllText($ref, $utf8)
    $m = [regex]::Match($t, '<link rel="canonical" href="(https?://[^"]*?)/articulo-01\.html"')
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

if ($Detectar) {
    $d = Get-DominioActual
    Write-Host ""
    if ($d) { Write-Host "  Dominio actual de las paginas: $d" -ForegroundColor Cyan }
    else    { Write-Host "  No se pudo detectar el dominio actual." -ForegroundColor Yellow }
    Write-Host ""
    return
}

if (-not $Dominio) { throw "Falta -Dominio. Usa -Detectar para ver el dominio actual." }

if ($Actual) { $MARCADOR = $Actual.Trim().TrimEnd('/') }
else         { $MARCADOR = Get-DominioActual }
if (-not $MARCADOR) { $MARCADOR = 'https://www.TU-DOMINIO.com' }

# Normaliza: sin barra final, con esquema
$Dominio = $Dominio.Trim().TrimEnd('/')
if ($Dominio -notmatch '^https?://') { $Dominio = "https://$Dominio" }

Write-Host ""
Write-Host "  Marcador : $MARCADOR" -ForegroundColor DarkGray
Write-Host "  Dominio  : $Dominio"  -ForegroundColor Cyan
if ($Simular) { Write-Host "  Modo     : SIMULACION (no se escribe nada)" -ForegroundColor Yellow }
Write-Host ""

if ($Archivos) {
    $objetivos = $Archivos | ForEach-Object { Get-Item (Join-Path $raiz $_) }
} else {
    $objetivos = @()
    $objetivos += Get-ChildItem -Path $raiz -Filter '*.html'
    $objetivos += Get-ChildItem -Path $raiz -Filter 'sitemap.xml' -ErrorAction SilentlyContinue
    $objetivos += Get-ChildItem -Path $raiz -Filter 'robots.txt'  -ErrorAction SilentlyContinue
}

$totalArchivos = 0
$totalCambios  = 0

foreach ($f in $objetivos) {
    $texto = [System.IO.File]::ReadAllText($f.FullName, $utf8)
    $n = ([regex]::Matches($texto, [regex]::Escape($MARCADOR))).Count

    if ($n -eq 0) {
        Write-Host ("  --  {0,-24} sin marcador" -f $f.Name) -ForegroundColor DarkGray
        continue
    }

    if (-not $Simular) {
        $texto = $texto.Replace($MARCADOR, $Dominio)
        [System.IO.File]::WriteAllText($f.FullName, $texto, $utf8)
    }

    Write-Host ("  OK  {0,-24} {1,3} sustituciones" -f $f.Name, $n) -ForegroundColor Green
    $totalArchivos++
    $totalCambios += $n
}

Write-Host ""
if ($Simular) {
    Write-Host "  Se cambiarian $totalCambios URLs en $totalArchivos archivos." -ForegroundColor Yellow
} else {
    Write-Host "  Listo: $totalCambios URLs actualizadas en $totalArchivos archivos." -ForegroundColor Green
}
Write-Host ""
Write-Host "  Recuerda tambien:" -ForegroundColor DarkGray
Write-Host "   - Cambiar el nombre del medio ficticio por el real en cada articulo." -ForegroundColor DarkGray
Write-Host "   - Enviar el sitemap.xml en Google Search Console." -ForegroundColor DarkGray
Write-Host ""
