# Valentín Sued (Sueco) · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar bajas protegidas y bitácora de rutinas manuales.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Protección de contraseñas y tokens. |
| 50 % | Alta, edición y baja de rutinas manuales. |
| 75 % | Consulta y baja de dietas, editor de comidas. |
| 90 % | Rutinas manuales y gestión visual de dietas. |

## Qué cambió del 90 % al 100 %

Te toca explicar qué baja cada operación, qué conserva y cuándo se vuelve visible el evento.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `DELETE /api/admin/roles/:id` | [eliminarRol](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L341) | Exige permiso `roles:gestionar` o ser Administrador, más `confirmar: true`. Busca el rol, verifica si es del sistema o está asignado, y si puede borrarlo registra `CU036_ELIMINAR_ROL` en la misma transacción. Responde 204, 404 si no existe o 409 si está protegido o asignado. |
| `POST /api/rutinas y PUT /api/rutinas/:id` | [guardarRutina](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/rutinas.controller.js#L148) | El guardado manual agrega `CU016_CREAR_RUTINA` o `CU018_EDITAR_RUTINA` después de guardar la rutina y sus ejercicios, dentro de la misma transacción. |
| `DELETE /api/rutinas/:id y DELETE /api/dietas/:id` | [eliminarRutina](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/rutinas.controller.js#L330) · [eliminarDieta](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L359) | Tras las validaciones ya existentes, se marcan como eliminadas y se registra `CU020_ELIMINAR_RUTINA` o `CU028_ELIMINAR_DIETA`. |

## Cómo mostrarlo

1. Con el rol que Gade asignó a una cuenta de prueba, intentá borrarlo y mostrá el rechazo. Pedile que lo reemplace por Cliente y repetí la baja. Verificá que el rol desaparece.
2. Creá o editá una rutina de prueba y después confirmá su baja. Mostrá en bitácora los eventos con ayuda de Mateo.
3. Cancelá una baja de dieta y comprobá que siga listada. Después confirmala y revisá el evento.

## Preguntas que te pueden hacer

**¿Qué diferencia hay entre borrar un rol y dar de baja una rutina?** El rol personalizado sin asignaciones se borra. Rutina y dieta quedan marcadas como eliminadas y salen de su listado habitual.

**¿Por qué un rol asignado devuelve 409?** El rol está en uso por una cuenta. Hay que actualizar primero esa asignación.

Volvé al [reparto y orden del ensayo](README.md).
