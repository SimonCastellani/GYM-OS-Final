# Iván Lerner · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar historial por fecha y comprobación de guardados.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Modelo Usuario, campos y persistencia. |
| 50 % | Registro e historial de entrenamientos. |
| 75 % | Creación manual de dietas. |
| 90 % | Entrenamientos, alta de dietas y alta/listado de usuarios en Administración. |

## Qué cambió del 90 % al 100 %

Los entrenamientos y la creación manual de dietas ya estaban en el 90 %. Enfocate en el filtro y en qué cambió en la persistencia y la bitácora.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `GET /api/entrenamientos` | [Historial y filtro](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/client/src/pages/Entrenamientos.jsx#L291) | El servidor sigue devolviendo la lista propia con los ejercicios. React guarda el día elegido en `fechaHistorial` y filtra localmente las sesiones del historial. |
| `PUT /api/entrenamientos/:id` | [actualizarRegistro](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/entrenamientos.controller.js#L141) | Valida que la sesión esté abierta, sea propia y que los ejercicios coincidan. Los ejercicios, el estado final y `CU021_CERRAR_ENTRENAMIENTO` se guardan en una transacción al cerrar. Guardar con estado iniciado no genera ese evento. |
| `POST /api/dietas` | [actualizarDieta](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L161) | Para un plan manual nuevo, la cabecera y sus comidas se guardan junto con `CU024_CREAR_DIETA`. Gade explica la regla de duplicados y Paulo muestra la edición de un plan existente. |

## Cómo mostrarlo

1. Prepará dos entrenamientos cerrados en fechas diferentes. Elegí una fecha, otra sin resultados y luego Ver todas las fechas.
2. Guardá un entrenamiento todavía iniciado y después cerralo con confirmación. Verificá con Mateo que el evento aparece al cerrar.
3. Creá una dieta manual de ejemplo y comprobá en la bitácora el alta exitosa. Dejá esa dieta disponible para que Paulo muestre su edición.

## Preguntas que te pueden hacer

**¿Filtrar por fecha hace otro GET?** El filtro usa la lista ya cargada. El endpoint no recibe ese día como parámetro.

**¿Por qué guardar el evento con el cierre?** Si falla la escritura, la transacción evita presentar el cierre y su evento como dos resultados separados.

Volvé al [reparto y orden del ensayo](README.md).
