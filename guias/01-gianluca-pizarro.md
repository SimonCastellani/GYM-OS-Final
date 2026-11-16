# Gianluca Pizarro · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar cierre de sesión y recuperación con bitácora.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Servidor, configuración y errores de la API. |
| 50 % | Registro, login, logout y salud. |
| 75 % | Validación de alimentos y baja de consumos. La ampliación le asignó recuperación por correo. |
| 90 % | Cuentas, recuperación y bloqueo temporal del login. |

## Qué cambió del 90 % al 100 %

La recuperación, los cinco intentos y el bloqueo de 15 minutos ya estaban en el 90 %. Explicá qué aporta la bitácora y cómo la versión final usa la cookie `gymos100`.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `POST /api/logout` | [cerrarSesion](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/usuarios.controller.js#L265) | Recibe la cookie de la sesión y `confirmar: true`. Dentro de una transacción elimina esa sesión en MySQL y registra `CU003_LOGOUT`. Limpia la cookie y responde 204. |
| `POST /api/restablecer-password` | [restablecerPassword](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/recuperacion.controller.js#L81) | Recibe el enlace de un solo uso y la contraseña nueva. En el cambio exitoso invalida las sesiones anteriores, consume el token y escribe `CU004_RECUPERAR_PASSWORD` antes de confirmar la transacción. |
| `GET /api/salud` | [healthcheck](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/index.js#L23) | Para la demo, verificá que la app final esté en 5176 y devuelva `version: "100"`. MySQL usa 3312 y Mailpit muestra el buzón local en 8026 con la configuración de ejemplo. |

## Cómo mostrarlo

1. Entrá con una cuenta de prueba y cancelá el cierre de sesión. Mostrá que seguís teniendo acceso a Mi cuenta.
2. Confirmá el cierre y comprobá que una ruta privada devuelve 401 si se reusa esa sesión. Pedile a Mateo que muestre `CU003_LOGOUT` en el panel de bitácora.
3. Con Mailpit configurado, solicitá un enlace para la cuenta de prueba, restablecé la contraseña e intentá reutilizarlo. Debería fallar y quedar un solo evento de restablecimiento exitoso.

## Preguntas que te pueden hacer

**¿Borrar la cookie basta para revocar una sesión?** El servidor también elimina el registro de esa sesión. La cookie anterior deja de servir aunque alguien la conserve.

**¿Cuándo queda el evento de recuperación?** Cuando se completó el cambio de contraseña, en la misma transacción. Pedir el correo no lo genera.

Volvé al [reparto y orden del ensayo](README.md).
