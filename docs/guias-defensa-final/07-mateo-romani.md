# Mateo Romani · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar progreso, auditoría e integridad de los datos.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Login y actualización de última conexión. |
| 50 % | Resumen y cálculo de progreso. |
| 75 % | Macros diarios y metas nutricionales. |
| 90 % | Progreso, macros diarios y panel de bitácora. |

## Qué cambió del 90 % al 100 %

Prepará el resumen de evidencia del grupo. La bitácora guarda eventos y el DVH/DVV resume el estado de los datos. Explicá qué pregunta responde cada uno.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `GET /api/progreso` | [Peso inicial y actual](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/client/src/pages/Progreso.jsx#L106) | React muestra el primer y el último peso y sus fechas a partir de las mediciones del gráfico. El cálculo de porcentaje por objetivo ya existía. |
| `GET /api/consumos y GET /api/admin/bitacora` | [verMacros](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/nutricion.controller.js#L466) · [verBitacora](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L376) | Consultar los macros ahora registra `CU030_CONSULTAR_MACROS`. La lectura de bitácora ya existía y devuelve hasta 100 eventos recientes. Tu tarea es mostrar qué eventos nuevos dejaron los flujos del equipo. |
| `Inicialización de MySQL` | [instalarIntegridad](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/config/instalar-integridad.js#L13) · [vista digitos_verificadores](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/sql/estructura.sql#L367) | El DVH se calcula en MySQL por fila, en 16 tablas. La vista `digitos_verificadores` expone nombre de tabla, cantidad de filas y DVV. El DER muestra 17 tablas, incluida `recuperaciones`, que no tiene DVH. |

## Cómo mostrarlo

1. Cargá dos mediciones de prueba y mostrales el primer peso y el actual, con fechas, en el resumen.
2. Pedile a otro integrante que guarde una acción de su demo y verificá su evento desde Administración. Mostrá que el acceso al panel de bitácora exige permiso `auditoria:ver` o Administrador.
3. En una base de prueba inicializada, ejecutá `SELECT nombre_tabla, filas, dvv FROM digitos_verificadores WHERE nombre_tabla = 'rutinas';` antes y después de un cambio confirmado en una rutina. Compará el DVV.

## Preguntas que te pueden hacer

**¿El DVV guarda un historial de los cambios?** La vista calcula un valor con el estado actual. Para rastrear acciones se usa la bitácora. El código final tampoco compara automáticamente el DVV contra una copia histórica.

**¿El peso inicial del gráfico es el valor inicial de todo objetivo?** El gráfico toma la primera medición de la serie. Un objetivo creado más tarde puede tener su propio valor inicial.

Volvé al [reparto y orden del ensayo](README.md).
