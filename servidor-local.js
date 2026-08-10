/* Servidor estático para revisar el kit de prensa en local.
   Uso:  node servidor-local.js     →  http://localhost:4321          */
const http = require('http'), fs = require('fs'), path = require('path');

const ROOT = __dirname;
const PORT = 4321;
const TIPOS = {
  '.html': 'text/html; charset=utf-8',
  '.jpg': 'image/jpeg', '.jpeg': 'image/jpeg', '.png': 'image/png', '.webp': 'image/webp',
  '.xml': 'application/xml; charset=utf-8', '.txt': 'text/plain; charset=utf-8',
  '.css': 'text/css; charset=utf-8', '.js': 'text/javascript; charset=utf-8'
};

http.createServer((req, res) => {
  let ruta = decodeURIComponent(req.url.split('?')[0]);
  if (ruta === '/') ruta = '/index.html';
  const archivo = path.resolve(path.join(ROOT, ruta));
  if (!archivo.startsWith(path.resolve(ROOT))) { res.writeHead(403).end('403'); return; }
  fs.readFile(archivo, (err, datos) => {
    if (err) { res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' }).end('404 · ' + ruta); return; }
    res.writeHead(200, { 'Content-Type': TIPOS[path.extname(archivo).toLowerCase()] || 'application/octet-stream' });
    res.end(datos);
  });
}).listen(PORT, () => console.log('Kit de prensa en http://localhost:' + PORT));
