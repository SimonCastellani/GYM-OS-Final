# Gade Silva y Lápiz · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar asignación de roles y alta de comidas sin duplicados.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Registro y transacción usuario–rol. |
| 50 % | Medidas y perfil físico. |
| 75 % | Alta de consumos y agregado de alimentos. |
| 90 % | Medidas, registro de consumos y bloqueo/activación de usuarios. |

## Qué cambió del 90 % al 100 %

La asignación retoma el registro con roles y el cierre de sesiones que ya explicabas al bloquear cuentas. El control nuevo se aplica al módulo de consumos que ya defendías. Simón explica la edición de consumos.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `PUT /api/admin/usuarios/:id/roles` | [asignarRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L278) | Recibe la lista completa de ids de roles y `confirmar: true`. Valida ids, duplicados y protección del último administrador activo. Reemplaza las filas de `usuario_roles`, elimina sesiones de la cuenta afectada y registra `ADMIN_ASIGNAR_ROLES` dentro de una transacción. |
| `POST /api/consumos` | [registrarComida](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L392) | El servidor valida la comida, busca consumos de esa cuenta y del mismo minuto y devuelve 409 si coincide nombre, tipo y alimentos. Dos altas simultáneas de la misma cuenta se ordenan con un bloqueo de su fila al guardar. |

## Cómo mostrarlo

1. Con una cuenta de prueba que ya esté abierta en otra ventana, asignale el rol personalizado preparado por Simón y confirmá. Mostrá que la sesión anterior deja de tener acceso y que al volver a entrar se aplican los permisos.
2. Probá asignar una lista repetida o vacía y verificá el rechazo. No uses la cuenta administradora principal para la prueba.
3. Cargá una comida y repetila con la misma fecha y hora. Mostrá el 409 y comprobá que los macros del día solo la cuentan una vez.

## Preguntas que te pueden hacer

**¿La lista enviada se agrega a la anterior?** La reemplaza. Si querés conservar un rol anterior, también tenés que incluirlo en la lista.

**¿Se prohíbe comer lo mismo varias veces?** La restricción es para la misma comida en el mismo minuto de la cuenta. Un consumo en otro horario puede guardarse.

Volvé al [reparto y orden del ensayo](README.md).
