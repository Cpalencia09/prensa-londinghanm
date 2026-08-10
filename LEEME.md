# Kit de prensa · LONDINGHANM y KEMONY

20 artículos de prensa en páginas independientes, cada uno con una plantilla de portal
de noticias distinta, redacción propia y marcado SEO completo.

---

## Contenido

| Archivo | Medio (ficticio) | Estilo | Tema |
|---|---|---|---|
| `articulo-01.html` | Gaceta Metropolitana | Magazine clásico serif | LONDINGHANM |
| `articulo-02.html` | El Enfoque Digital | Minimalista, lectura larga | LONDINGHANM |
| `articulo-03.html` | Diario Empresarial | Económico, tres columnas | LONDINGHANM |
| `articulo-04.html` | ATELIER Magazine | Revista de moda editorial | LONDINGHANM |
| `articulo-05.html` | Nodo Digital | Tech, modo oscuro | LONDINGHANM |
| `articulo-06.html` | El Popular al Día | Tabloide amarillo/negro | LONDINGHANM |
| `articulo-07.html` | Revista Contraste | Cultural, reportaje largo | LONDINGHANM |
| `articulo-08.html` | Noticias al Instante | Portal general, tarjetas | LONDINGHANM |
| `articulo-09.html` | Boletín Informativo RD | Blog clásico con sidebar | LONDINGHANM |
| `articulo-10.html` | Pulso Urbano | Entretenimiento, neón | LONDINGHANM |
| `articulo-11.html` | Agencia Iberoprensa | Nota de prensa corporativa | LONDINGHANM |
| `articulo-12.html` | El Correo Diario | Periódico impreso, columnas | LONDINGHANM |
| `articulo-13.html` | Minuto Noticias | Mobile first, lectura rápida | LONDINGHANM |
| `articulo-14.html` | Capital & Marca | Revista de negocios premium | LONDINGHANM |
| `articulo-15.html` | Ágora Noticias | Foro agregador con votos | LONDINGHANM |
| `articulo-16.html` | Diario Regional Hoy | Regional, rojo institucional | LONDINGHANM |
| `articulo-17.html` | The Luxe Report | Lujo, negro y oro | LONDINGHANM |
| `articulo-18.html` | Industria & Consumo | Sectorial industrial | **KEMONY** |
| `articulo-19.html` | Red Informativa Nacional | Teletipo de agencia | **KEMONY** |
| `articulo-20.html` | Meridiano | Brutalista tipográfico | LONDINGHANM |

Otros archivos:

- `index.html` — índice navegable con miniaturas y filtro por marca.
- `sitemap.xml` — con extensiones de Google News e imágenes.
- `robots.txt`
- `reemplazar-dominio.ps1` — cambia el dominio marcador por el real.
- `servidor-local.js` — servidor estático para revisar el kit antes de publicar.
- `img/` — 12 fotografías.

---

## Despliegue

El kit está publicado en GitHub Pages desde el repositorio
[`Cpalencia09/prensa-londinghanm`](https://github.com/Cpalencia09/prensa-londinghanm):

**https://cpalencia09.github.io/prensa-londinghanm/**

Se despliega solo: cualquier `git push` a `main` actualiza el sitio en un par de minutos.

---

## Antes de publicar en un portal real

### 1. Cambiar el dominio

Las URLs canónicas, Open Graph, JSON-LD y el sitemap apuntan ahora a la URL de
GitHub Pages. Para cambiarlas al dominio del portal donde se publique cada pieza:

```powershell
.\reemplazar-dominio.ps1 -Dominio "https://www.elportalreal.com"
```

El script **detecta solo** el dominio que tienen las páginas en ese momento, así que
funciona tantas veces como haga falta. Otras opciones:

| Opción | Para qué |
|---|---|
| `-Detectar` | Muestra qué dominio tienen ahora las páginas, sin tocar nada |
| `-Simular` | Enseña qué cambiaría sin escribir |
| `-Archivos "articulo-07.html"` | Actúa solo sobre una pieza |
| `-Actual "https://viejo.com"` | Fuerza el dominio de origen si la detección falla |

> Importante: el script lee y escribe en UTF-8 sin BOM. No uses `Get-Content` /
> `Set-Content` a secas sobre estos archivos: en Windows PowerShell 5.1 rompen los acentos.

### 2. Cambiar el nombre del medio

Los nombres de los medios son **ficticios** y sirven de marcador. Sustitúyelos por
el nombre real del portal donde se publique cada pieza, junto con su logotipo,
enlaces de menú y datos de contacto del pie.

### 3. Revisar en local

```bash
node servidor-local.js
```

Abre `http://localhost:4321`.

### 4. Enviar el sitemap

Sube `sitemap.xml` a la raíz del dominio y regístralo en Google Search Console.

> En GitHub Pages el kit se sirve bajo la subruta `/prensa-londinghanm/`, así que el
> `robots.txt` incluido **no lo lee Google** (solo se honra el de la raíz del dominio).
> Sí puedes enviar el `sitemap.xml` manualmente desde Search Console.

---

## Qué incluye el SEO de cada artículo

- `<title>` y `meta description` únicos, dentro del límite que muestra Google
  (título ≤ 65 caracteres, descripción entre 119 y 162).
- `<link rel="canonical">`, `robots` con `max-image-preview:large`, `hreflang`
  (`es` y `x-default`), y `prev` / `next` entre piezas.
- Open Graph completo (12 etiquetas) y Twitter Card `summary_large_image`.
- JSON-LD con `NewsArticle`, `Organization`, `WebSite` y `BreadcrumbList`,
  más `about` apuntando a la marca y a la persona.
- Imágenes con `alt` descriptivo, `width` / `height` (evita saltos de layout),
  `loading="lazy"` en las secundarias y `fetchpriority="high"` + `preload` en la principal.
- Fechas semánticas con `<time datetime="2026-07-17">`.
- Bloque de enlazado interno «Seguir leyendo» que conecta las 20 piezas y el índice.
- `<meta name="news_keywords">` y `article:tag` por pieza.

Cada artículo mantiene **redacción propia**: mismos hechos, distinto texto y titular,
para no generar contenido duplicado entre portales.

---

## Imágenes

| Archivo | Origen |
|---|---|
| `kit-londinghanm-01.jpg` | Material de prensa de la marca |
| `kit-londinghanm-02.jpg` | Material de prensa de la marca |
| `boutique-moda.jpg`, `percheros-tienda.jpg`, `detalle-perchas.jpg`, `prenda-minimalista.jpg` | Pexels · licencia libre para uso comercial |
| `produccion-fotografica.jpg`, `sesion-estudio.jpg` | Pexels · licencia libre para uso comercial |
| `compra-online.jpg`, `comercio-digital.jpg` | Pexels · licencia libre para uso comercial |
| `almacen-distribucion.jpg`, `logistica-operaciones.jpg` | Pexels · licencia libre para uso comercial |

Las fotos de Pexels no requieren atribución. Todas están alojadas localmente: las
páginas no hacen ninguna petición a servidores externos (sin CDN, sin fuentes remotas).

---

## Nota sobre las plantillas

Cada archivo es autónomo: HTML, CSS y el poco JavaScript que usa van dentro del propio
documento. Puedes subir un artículo suelto a cualquier hosting y funcionará, siempre que
copies también la carpeta `img/`.
