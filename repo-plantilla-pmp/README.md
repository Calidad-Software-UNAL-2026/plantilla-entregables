# Repositorio plantilla — Entrega 1 (PMP + Contrato)

Repositorio base para que cada equipo desarrolle la Entrega 1 siguiendo
la rúbrica del curso, usando GitHub como herramienta de gestión.
Corresponde al criterio **1.7** de la rúbrica (`rubrica-entrega-1.md`).

## Qué distribuir a cada equipo

**No uses `fork` directo.** Distribuye este repositorio de una de estas
dos formas:

1. **Recomendado: GitHub Classroom.** Crea una asignación desde este
   repo como plantilla; Classroom genera un repositorio **privado** por
   equipo y te añade automáticamente como colaborador/profesor en todos.
   Evita invitar manualmente a 6 personas por equipo y evita que un
   equipo vea el trabajo de otro (que sí pasaría con forks públicos).
2. **Alternativa manual:** marca este repo como *Template repository*
   (Settings → General → "Template repository") y que cada equipo use el
   botón **"Use this template"**. El repo resultante queda desligado del
   original (sin red de forks) y puede crearse como privado.

## Puesta en marcha por equipo (una sola vez)

1. Crear el repo del equipo (Classroom o "Use this template").
2. Activar protección de rama — Settings → Branches → Add rule sobre
   `main`:
   - ✅ Require a pull request before merging
   - ✅ Require approvals → mínimo 1
   - Esto genera la evidencia de revisión cruzada del Paso 9, ítem 2, y
     respalda el nivel Excelente del criterio "Adherencia al flujo de
     trabajo" (1.5).
3. Crear labels: `./scripts/setup-labels.sh` (requiere `gh` instalado y
   autenticado — `gh auth login`).
4. Crear la primera página de la wiki manualmente desde el navegador
   (pestaña **Wiki → Create the first page**) — GitHub exige esto antes
   de que la wiki exista como repositorio clonable.
5. Poblar el resto de la wiki: `./scripts/setup-wiki.sh <url-del-repo>`.
6. Crear el issue raíz del EDT (ver plantilla más abajo) y activar
   *sub-issues* / listas de tareas dentro de él para representar la
   jerarquía del WBS.
7. (Opcional) Crear un GitHub Project (v2) y añadir campos personalizados
   `Probabilidad`, `Impacto`, `Estrategia` para el registro de riesgos.

## Estructura del repositorio

```
.github/
  workflows/mapa-procesos.yml   # Paso 3: mapa de procesos + modelo de ciclo de vida
  ISSUE_TEMPLATE/                # Formularios para requisitos y riesgos
  PULL_REQUEST_TEMPLATE.md       # Checklist de revisión cruzada
docs/
  mapa-procesos.md                # Generado automáticamente por el workflow
  estimacion-cronograma.md        # Paso 6: FPA, Planning Poker, PERT, Gantt, presupuesto
wiki-plantillas/                  # Contenido fuente para pegar en la wiki real
scripts/
  setup-labels.sh                 # Crea la taxonomía de labels
  setup-wiki.sh                   # Copia wiki-plantillas/ a la wiki real del equipo
```

## Issue raíz del EDT (plantilla de texto)

Copia esto en un issue nuevo llamado "EDT/WBS — Paso 4" y usa la función
de **sub-issues** (o listas de tareas `- [ ]` que GitHub convierte en
sub-issues automáticamente) para desglosar cada entregable:

```markdown
## EDT/WBS

- [ ] Entregable 1: PMP
  - [ ] Paquete de trabajo 1.1
  - [ ] Paquete de trabajo 1.2
- [ ] Entregable 2: Contrato
  - [ ] Paquete de trabajo 2.1
```

## Dónde va cada cosa (resumen — detalle completo en criterio 1.7 de la rúbrica)

| Contenido | Dónde |
|---|---|
| Narrativa fija (Pasos 1, 2.1-2.3, 2.5, 4 sin EDT, 5.1, 6.1, 7, 8, PMP, contrato) | Wiki (`wiki-plantillas/`) |
| Requisitos funcionales/no funcionales | Issues + labels `tipo:funcional` / `tipo:no-funcional` |
| Riesgos | Issues + label `riesgo` (+ Project para campos de análisis) |
| EDT/WBS | Sub-issues del issue raíz |
| Cronograma/hitos | Milestones + issues asociados |
| Mapa de procesos + ciclo de vida | GitHub Actions → `docs/mapa-procesos.md` (Mermaid) |
| Matriz de trazabilidad | Referencias cruzadas entre issues (`Relates to #...`) |
| Revisión cruzada | Pull Requests con aprobación obligatoria |

Ver `CONTRIBUTING.md` para el flujo de trabajo día a día del equipo.
