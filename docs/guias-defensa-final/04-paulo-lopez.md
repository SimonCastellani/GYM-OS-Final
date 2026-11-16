# Paulo López Stanley · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar formulario de roles y edición de dietas.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Roles, tabla intermedia y relaciones de MySQL. |
| 50 % | Objetivos personales y sus rutas. |
| 75 % | Edición de dietas. |
| 90 % | Frontend de Objetivos y edición de dietas y usuarios. |

## Qué cambió del 90 % al 100 %

El formulario nuevo se relaciona con tu experiencia editando formularios y con los roles que te asignaron en el 25 %. Objetivos sigue siendo tu base del 90 %. El cambio del gráfico lo expone Mateo.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `POST /api/admin/roles y PUT /api/admin/roles/:id` | [guardarRol](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/client/src/pages/Administracion.jsx#L96) | Defendé la parte de React. Si no hay `rolId`, manda POST. Si hay un id seleccionado, manda PUT. En ambos manda `nombre`, `descripcion` y `permisos`. Simón explica la lógica del servidor y sus respuestas. |
| `PUT /api/dietas/:id` | [actualizarDieta](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L161) | Mostrá que el guardado de una dieta manual existente conserva su id y ahora registra `CU027_EDITAR_DIETA` al guardar. |

## Cómo mostrarlo

1. Abrí Roles y permisos, mostrá qué estado guarda el formulario y prepará el rol de ejemplo para el ensayo de Simón.
2. Entrá a editar ese rol y mostrale al grupo en Red del navegador cómo el método cambia a PUT con el id. Repetí con un dato inválido para ver el mensaje del backend.
3. Abrí la dieta de Iván, modificá un campo, guardá y comprobá que se conserva el id y aparece el evento de edición.

## Preguntas que te pueden hacer

**¿Editar la definición de un rol y asignarlo a una cuenta usan el mismo formulario?** Son recorridos distintos. La definición usa `/admin/roles/:id`. Gade explica la asignación a un usuario.

**¿Por qué React oculta el formulario según permisos?** La interfaz evita mostrar acciones que la cuenta no puede usar. La validación decisiva ocurre en el servidor.

Volvé al [reparto y orden del ensayo](README.md).
