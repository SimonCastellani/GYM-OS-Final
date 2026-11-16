# Simón Castellani · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar crear y modificar roles, y editar consumos con control de duplicados.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Validaciones, rutas y demostración HTTP. |
| 50 % | Mi cuenta y datos personales. |
| 75 % | Edición de consumos y alimentos. |
| 90 % | Perfil, cambio de contraseña y bajas de cuentas. |

## Qué cambió del 90 % al 100 %

Defendé el recorrido completo desde la ruta al controlador y al modelo. Paulo explica los estados del formulario React, Gade cómo se asigna el rol y Valentín cuándo se puede borrar.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `POST /api/admin/roles` | [crearRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L230) | Recibe `nombre`, `descripcion`, `permisos`. Valida nombre de 2 a 50 caracteres, descripción hasta 255 y permisos de la lista admitida. Si guarda, devuelve 201 y registra `CU033_CREAR_ROL`. Si el nombre ya existe, el guardado falla con 409. |
| `PUT /api/admin/roles/:id` | [modificarRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L388) | Delega en `crearRoles`. Al encontrar id, bloquea y edita el rol seleccionado dentro de una transacción. Responde 200 con el rol y registra `CU035_EDITAR_ROL`. Si el id no existe da 404. Si el rol es del sistema devuelve 409. |
| `PUT /api/consumos/:id` | [registrarComida](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L392) | Carga el consumo propio, deja fuera su mismo id al buscar duplicados y registra `EDITAR_CONSUMO` cuando guarda. Gade defiende el alta con POST y vos explicás qué cambia en PUT. |

## Cómo mostrarlo

1. Creá desde Administración un rol `Lectura de prueba` con `usuarios:ver`. Mostrá la respuesta y dejalo preparado para el ensayo de Gade.
2. Editá el nombre o permisos y confirmá que el id sigue igual. Probá crear otro con el mismo nombre, o editar Cliente, y explicá el 409. Coordiná con Mateo para ver ambos eventos exitosos.
3. Editá un consumo guardado y comprobá que conserva el id. Después intentá llevarlo a los mismos datos y horario de otro consumo de la cuenta y mostrale al grupo por qué se rechaza.

## Preguntas que te pueden hacer

**¿Qué diferencia hay entre PUT de un rol y PUT de los roles de un usuario?** El primero modifica la definición y sus permisos. El segundo reemplaza qué roles tiene una cuenta en `usuario_roles`.

**¿Dónde se decide si puedo editar un rol?** La ruta comprueba la sesión y el permiso. El controlador además comprueba que el rol exista y que no sea un rol de sistema.

Volvé al [reparto y orden del ensayo](README.md).
