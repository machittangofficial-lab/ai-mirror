#!/bin/sh
# Wraps app.html into a standalone, installable page in site/ (for GitHub Pages or any HTTPS host).
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="ko"><head><meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="theme-color" content="#0b0c0e"><meta name="apple-mobile-web-app-capable" content="yes">\n'
  printf '<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">\n'
  printf '<link rel="manifest" href="manifest.webmanifest"><link rel="icon" href="icon.svg"><link rel="apple-touch-icon" href="icon.svg">\n'
  printf '<style>*,*::before,*::after{box-sizing:border-box}body{margin:0}</style></head><body>\n'
  cat app.html
  printf '\n<script>if("serviceWorker" in navigator)navigator.serviceWorker.register("sw.js").catch(()=>{});</script>\n</body></html>\n'
} > site/index.html
