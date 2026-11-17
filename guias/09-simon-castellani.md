# Simón Castellani · Defensa final de GYM-OS

**Tu tarea es explicar y demostrar cómo el servidor crea y modifica roles personalizados.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Validaciones, rutas y demostración HTTP. |
| 50 % | Mi cuenta y datos personales. |
| 75 % | Edición de consumos y alimentos. |
| 90 % | Perfil, cambio de contraseña y bajas de cuentas. |

## Qué cambió del 90 % al 100 %

En el 90 % había roles fijos y tu guía reservaba la creación y modificación de roles personalizados para el cierre. En el 100 % podés, por ejemplo, crear un rol «Lectura de prueba» con permiso para consultar usuarios y luego editar su descripción sin cambiar su ID.

Defendé el recorrido desde la ruta hasta MySQL. Paulo explica el formulario React, Joaquín el listado, Gade la asignación del rol a una cuenta y Valentín la baja.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `POST /api/admin/roles` | [crearRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L230) | Recibe `nombre`, `descripcion`, `permisos`. Valida nombre de 2 a 50 caracteres, descripción hasta 255 y permisos de la lista admitida. Si guarda, devuelve 201 y registra `CU033_CREAR_ROL`. Si el nombre ya existe, el guardado falla con 409. |
| `PUT /api/admin/roles/:id` | [modificarRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L388) | Delega en `crearRoles`. Al encontrar id, bloquea y edita el rol seleccionado dentro de una transacción. Responde 200 con el rol y registra `CU035_EDITAR_ROL`. Si el id no existe da 404. Si el rol es del sistema devuelve 409. |

## Cómo mostrarlo

1. Creá desde Administración un rol `Lectura de prueba` con `usuarios:ver`. Mostrá la respuesta y dejalo preparado para el ensayo de Gade.
2. Editá el nombre o permisos y confirmá que el id sigue igual. Probá crear otro con el mismo nombre, o editar Cliente, y explicá el 409. Consultá ambos eventos exitosos en bitácora.
3. Probá enviar un permiso inventado, como `usuarios:inventado`. El servidor responde `400` antes de guardar. Mostrá la respuesta desde la pestaña Red o con una petición a la API.

## Preguntas que te pueden hacer

**¿Qué diferencia hay entre PUT de un rol y PUT de los roles de un usuario?** El primero modifica la definición y sus permisos. El segundo reemplaza qué roles tiene una cuenta en `usuario_roles`.

**¿Dónde se decide si puedo editar un rol?** La ruta comprueba la sesión y el permiso. El controlador además comprueba que el rol exista y que no sea un rol de sistema.

**¿Por qué guardamos el rol y la bitácora en la misma transacción?** Si falla algún paso del guardado, se deshacen los cambios de esa operación. Así alta o edición y evento quedan confirmados juntos.

Volvé al [reparto y orden del ensayo](README.md).
