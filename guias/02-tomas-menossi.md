# Tomás Menossi · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar asistente del 100 % y registro de planes nuevos con IA.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Conexión MySQL y preparación del entorno. |
| 50 % | Chat con Cohere e historial de conversaciones. |
| 75 % | Generación de rutinas con IA. |
| 90 % | Chat y generación de rutinas y dietas con IA. |

## Qué cambió del 90 % al 100 %

El modo Soporte se actualizó para conocer la gestión de usuarios y roles. Su llamada usa el formato JSON general de `generarConIA` y conserva la validación del campo `respuesta` en el servidor.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `POST /api/ia/consulta` | [responderConsulta](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/ia.controller.js#L295) | Comprueba consentimiento y los datos de la consulta, carga el contexto de la conversación propia, obtiene la respuesta y guarda los mensajes junto al evento `CU031_CONSULTAR_BOT`. |
| `POST /api/ia/rutinas` | [generarRutinaIA](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/ia.controller.js#L89) | La generación nueva ya existía. El cambio es el evento `CU015_GENERAR_RUTINA`, que se guarda con la rutina y sus ejercicios. |
| `POST /api/ia/dietas` | [generarDietaIA](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/dietas-ia.controller.js#L137) | La generación ya existía. El controlador usa el guardado común de nutrición, que ahora distingue la creación con IA (`CU023_GENERAR_DIETA`) de una dieta manual. |

## Cómo mostrarlo

1. Con una cuenta que dio consentimiento y Cohere configurado, preguntá en modo Soporte dónde se administran los roles. Mostrá conversación y bitácora con ayuda de Mateo.
2. Desactivá el consentimiento en Mi cuenta y comprobá que el envío se rechaza antes de llegar al proveedor.
3. Con medidas y objetivo activo, generá un plan nuevo. Explicá en qué punto se registra el evento. Coordiná con Joaquín para que su parte empiece con un plan ya existente.

## Preguntas que te pueden hacer

**¿El asistente puede cambiarle el rol a alguien?** El chat orienta. La acción real se hace en Administración y la API exige permisos.

**¿Qué pasa si Cohere falla?** El servidor responde con error. En el chat no se guardan los mensajes ni el evento como si hubiera respondido correctamente.

Volvé al [reparto y orden del ensayo](README.md).
