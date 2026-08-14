# Kit de prensa · Alejandro Alfredo Londoño Guerrero

20 artículos de prensa en páginas independientes, cada uno con una plantilla de portal
de noticias distinta, redacción propia y marcado SEO completo.

**15 perfiles profesionales** de Alejandro Alfredo Londoño Guerrero y **5 piezas de marca**
sobre LONDINGHANM y KEMONY.

---

## Alcance del contenido

> Los textos se apoyan **únicamente en información contrastable** sobre la actividad
> empresarial en LONDINGHANM y KEMONY: los procesos de consolidación de marca y de
> expansión, los criterios de gestión y las declaraciones difundidas por las compañías.
>
> **No contienen datos biográficos, formativos, premios ni iniciativas sociales.** Para
> incorporarlos hace falta documentación de respaldo; inventarlos expondría al perfil a
> un desmentido.

---

## Contenido

| Archivo | Medio (ficticio) | Estilo | Tema |
|---|---|---|---|
| `articulo-01.html` | Gaceta Metropolitana | Magazine clásico serif | Perfil · dos sectores, un criterio |
| `articulo-02.html` | El Enfoque Digital | Minimalista, lectura larga | Perfil · su método de trabajo |
| `articulo-03.html` | Diario Empresarial | Económico, tres columnas | Perfil · moda y alimentación |
| `articulo-04.html` | ATELIER Magazine | Revista de moda editorial | **Marca** · LONDINGHANM |
| `articulo-05.html` | Nodo Digital | Tech, modo oscuro | Perfil · comercio digital |
| `articulo-06.html` | El Popular al Día | Tabloide amarillo/negro | Perfil · la constancia |
| `articulo-07.html` | Revista Contraste | Cultural, reportaje largo | **Marca** · narrativa visual |
| `articulo-08.html` | Noticias al Instante | Portal general, tarjetas | Perfil · la operación |
| `articulo-09.html` | Boletín Informativo RD | Blog clásico con sidebar | Perfil · cambios en el consumo |
| `articulo-10.html` | Pulso Urbano | Entretenimiento, neón | Perfil · construir una marca |
| `articulo-11.html` | Agencia Iberoprensa | Nota de prensa corporativa | Perfil · ficha profesional |
| `articulo-12.html` | El Correo Diario | Periódico impreso, columnas | **Marca** · LONDINGHANM |
| `articulo-13.html` | Minuto Noticias | Mobile first, lectura rápida | Perfil · cinco claves |
| `articulo-14.html` | Capital & Marca | Revista de negocios premium | Perfil · la coherencia |
| `articulo-15.html` | Ágora Noticias | Foro agregador con votos | **Marca** · presentación de prendas |
| `articulo-16.html` | Diario Regional Hoy | Regional, rojo institucional | Perfil · distribuidores |
| `articulo-17.html` | The Luxe Report | Lujo, negro y oro | Perfil · la confianza |
| `articulo-18.html` | Industria & Consumo | Sectorial industrial | **Empresa** · KEMONY |
| `articulo-19.html` | Red Informativa Nacional | Teletipo de agencia | Perfil · crecimiento regional |
| `articulo-20.html` | Meridiano | Brutalista tipográfico | Perfil · balance de cierre |

Otros archivos:

- `index.html` — índice navegable con miniaturas y filtro por tipo de pieza.
- `sitemap.xml` — con extensiones de Google News e imágenes.
- `robots.txt`
- `reemplazar-dominio.ps1` — cambia el dominio de todas las URLs.
- `servidor-local.js` — servidor estático para revisar el kit antes de publicar.
- `img/` — 26 imágenes.

---

## Despliegue

Publicado en GitHub Pages desde [`Cpalencia09/prensa-londinghanm`](https://github.com/Cpalencia09/prensa-londinghanm):

**https://cpalencia09.github.io/prensa-londinghanm/**

Se despliega solo: cualquier `git push` a `main` actualiza el sitio en un par de minutos.

---

## Antes de publicar en un portal real

### 1. Cambiar el dominio

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

> En GitHub Pages el kit se sirve bajo la subruta `/prensa-londinghanm/`, así que el
> `robots.txt` incluido **no lo lee Google** (solo se honra el de la raíz del dominio).
> Sí puedes enviar el `sitemap.xml` manualmente desde Search Console.

---

## Qué incluye el SEO de cada artículo

- `<title>` y `meta description` únicos, dentro del límite que muestra Google
  (título ≤ 65 caracteres, descripción entre 125 y 165).
- `<link rel="canonical">`, `robots` con `max-image-preview:large`, `hreflang`
  (`es` y `x-default`), y `prev` / `next` entre piezas.
- Open Graph completo (12 etiquetas) y Twitter Card `summary_large_image`.
- JSON-LD con `NewsArticle`, `Organization`, `WebSite` y `BreadcrumbList`, más
  `about` apuntando a la **persona**, la marca y la empresa, y `mentions`.
- Imágenes con `alt` descriptivo, `width` / `height` (evita saltos de layout),
  `loading="lazy"` en las secundarias y `fetchpriority="high"` + `preload` en la principal.
- Fechas semánticas con `<time datetime="2026-07-17">`.
- Bloque de enlazado interno «Seguir leyendo» que conecta las 20 piezas y el índice.

Cada artículo mantiene **redacción propia**: mismos hechos, distinto texto y titular,
para no generar contenido duplicado entre portales.

---

## Imágenes

**26 archivos**, todos alojados en local. Las páginas no hacen ninguna petición a
servidores externos: sin CDN, sin fuentes remotas.

### Fotografías de Alejandro Alfredo Londoño Guerrero (14)

Generadas a partir de **dos fotografías originales** mediante recorte y tratamiento de
color. No son montajes: el fondo de cada una es el de la toma original.

| Base | Variantes |
|---|---|
| `aalg-despacho-*` | panorámica, retrato, cuadrada, banner, blanco y negro, duotono, frío |
| `aalg-lounge-*` | panorámica, retrato, cuadrada, primer plano, banner, blanco y negro, cálido |

### Material de marca y contexto (12)

| Archivo | Origen |
|---|---|
| `kit-londinghanm-01.jpg`, `kit-londinghanm-02.jpg` | Material de prensa de la marca |
| `boutique-moda`, `percheros-tienda`, `detalle-perchas`, `prenda-minimalista` | Pexels · licencia libre para uso comercial |
| `produccion-fotografica`, `sesion-estudio` | Pexels · licencia libre para uso comercial |
| `compra-online`, `comercio-digital` | Pexels · licencia libre para uso comercial |
| `almacen-distribucion`, `logistica-operaciones` | Pexels · licencia libre para uso comercial |

Las fotos de Pexels no requieren atribución.

---

## Nota sobre las plantillas

Cada archivo es autónomo: HTML, CSS y el poco JavaScript que usa van dentro del propio
documento. Puedes subir un artículo suelto a cualquier hosting y funcionará, siempre que
copies también la carpeta `img/`.
