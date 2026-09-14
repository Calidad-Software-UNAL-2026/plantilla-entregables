# Flujo de trabajo del equipo

## Para contenido narrativo (wiki)

1. Entra a la pestaña **Wiki** del repo y edita la página correspondiente
   (ver `_Sidebar.md` para la lista completa), **o** clona la wiki
   localmente si prefieres trabajar con tu editor y pasar por revisión
   antes de publicar:
   ```
   git clone https://github.com/<org>/<repo>.wiki.git
   ```
2. Si editas desde el navegador, avisa al equipo en el issue/canal de
   comunicación antes de dar por cerrada la sección — la wiki nativa no
   pasa por Pull Request, así que la "revisión cruzada" ahí es manual.
3. Si clonas la wiki localmente, sí puedes hacer `git blame`/`git log -p`
   sobre cualquier página para ver quién escribió cada línea y cuándo.

## Para requisitos y riesgos (issues)

1. Pestaña **Issues → New issue** → elige la plantilla (`Requisito
   funcional`, `Requisito no funcional`, `Riesgo`).
2. Asigna labels de módulo (`modulo:<nombre>`) y prioridad si aplica.
3. Para riesgos: asigna un **Assignee** real (ese es el "responsable").
4. Vincula el issue al Milestone del hito correspondiente (barra lateral
   derecha del issue).
5. Para trazabilidad: en la descripción, referencia issues relacionados
   escribiendo `Relates to #12` o, si el requisito queda satisfecho por
   completar otro issue, `Closes #12`.

## Para el mapa de procesos (Paso 3)

1. Edita `.github/workflows/mapa-procesos.yml`: duplica el bloque de un
   job por cada proceso ISO/IEC/IEEE 12207 que tu equipo seleccionó,
   ajustando los `needs:` para reflejar el orden real de tu modelo de
   ciclo de vida.
2. Ve a la pestaña **Actions**, selecciona el workflow y pulsa
   **"Run workflow"**.
3. El resultado queda en `docs/mapa-procesos.md`, con el diagrama Mermaid
   renderizado automáticamente al abrir el archivo en GitHub.

## Para consolidar el PMP y el contrato (Paso 9)

1. Clona la wiki localmente (ver arriba).
2. Crea una rama, edita `09a-PMP.md` y `09b-Contrato.md` consolidando lo
   ya escrito en las demás páginas.
3. Abre un Pull Request **desde el repo de la wiki** (no del repo
   principal) hacia `master`, y pide que al menos un integrante distinto
   apruebe antes de mergear.
4. Para el resto del repo (issues, EDT, workflow), la protección de rama
   de `main` ya exige 1 aprobación antes de mergear cualquier Pull
   Request — úsala también para cambios sustanciales de estructura, no
   solo para el PMP final.

## Reglas generales

- Ningún artefacto es "propiedad" de una sola persona: toda sección debe
  poder explicarla cualquier integrante en la sustentación.
- Los commits/ediciones genéricos ("cambios varios") no cuentan como
  evidencia de proceso — sé específico en los mensajes de commit y en
  los comentarios de los issues.
