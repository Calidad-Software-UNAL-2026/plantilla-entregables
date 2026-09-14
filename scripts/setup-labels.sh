#!/usr/bin/env bash
# Crea la taxonomía de labels del proyecto usando GitHub CLI (`gh`).
# Requiere: gh instalado y autenticado (`gh auth login`), y ejecutarse
# dentro de una copia local del repo del equipo (o pasar --repo owner/repo).
#
# Uso:
#   ./scripts/setup-labels.sh                # repo actual (cwd)
#   ./scripts/setup-labels.sh owner/repo      # repo explícito

set -euo pipefail

REPO_FLAG=()
if [[ "${1:-}" != "" ]]; then
  REPO_FLAG=(--repo "$1")
fi

create_label () {
  local name="$1" color="$2" desc="$3"
  # --force actualiza el label si ya existe (color/descripción)
  gh label create "$name" --color "$color" --description "$desc" --force "${REPO_FLAG[@]}"
}

# Tipo de requisito (Paso 2, ítem 4)
create_label "tipo:funcional"     "1D76DB" "Requisito funcional"
create_label "tipo:no-funcional"  "0E8A16" "Requisito no funcional / de calidad"

# Riesgos (Paso 5)
create_label "riesgo"             "D93F0B" "Registro de riesgo del proyecto"

# Prioridad (opcional, útil para el backlog de requisitos)
create_label "prioridad:alta"     "B60205" "Prioridad alta"
create_label "prioridad:media"    "FBCA04" "Prioridad media"
create_label "prioridad:baja"     "C2E0C6" "Prioridad baja"

echo "Labels creados/actualizados."
echo "Personaliza labels 'modulo:<nombre>' manualmente según los módulos de tu dominio, por ejemplo:"
echo '  gh label create "modulo:pagos" --color "5319E7" --description "Módulo de pagos"'
