#!/usr/bin/env bash
# Copia las plantillas de wiki-plantillas/ hacia la wiki real del repositorio
# del equipo. Necesario porque GitHub NO copia la wiki al crear un repo
# desde un "template repository" ni al hacer fork — solo copia archivos
# del repo normal.
#
# IMPORTANTE (requisito de GitHub): la wiki de un repo no existe como
# repositorio git clonable hasta que alguien crea al menos UNA página
# desde la interfaz web (pestaña "Wiki" -> "Create the first page").
# Hazlo antes de correr este script.
#
# Uso:
#   ./scripts/setup-wiki.sh https://github.com/<org>/<repo-del-equipo>.git

set -euo pipefail

if [[ "${1:-}" == "" ]]; then
  echo "Uso: $0 https://github.com/<org>/<repo-del-equipo>.git"
  exit 1
fi

REPO_URL="$1"
WIKI_URL="${REPO_URL%.git}.wiki.git"
TMP_DIR="$(mktemp -d)"

echo "Clonando wiki: $WIKI_URL"
git clone "$WIKI_URL" "$TMP_DIR"

echo "Copiando plantillas..."
cp -n "$(dirname "$0")/../wiki-plantillas/"*.md "$TMP_DIR/"

cd "$TMP_DIR"
git add .
if git diff --cached --quiet; then
  echo "No hay cambios nuevos que subir (las páginas ya existían)."
else
  git commit -m "docs(wiki): inicializar estructura de páginas desde plantilla del curso"
  git push
  echo "Wiki poblada correctamente."
fi

rm -rf "$TMP_DIR"
