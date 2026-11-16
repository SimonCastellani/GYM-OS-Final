# Joaquín Casanou · Defensa final de GYM-OS

**Tu tarea es revisar y demostrar consulta de roles y validación previa a adaptar planes.**

## De dónde viene tu parte

| Entrega | Reparto anterior |
|---|---|
| 25 % | Persistencia, vencimiento y revocación de sesiones. |
| 50 % | Catálogo de ejercicios y consulta de rutinas. |
| 75 % | Adaptación de rutinas con IA. |
| 90 % | Catálogo y adaptación de rutinas y dietas con IA. |

## Qué cambió del 90 % al 100 %

El caso fuerte es explicar qué datos nuevos se consultan o exigen antes de usar la operación. Tomás muestra generación nueva y a vos te toca adaptar lo que ya existe.

| Ruta o pantalla | Función o archivo | Qué explicar |
|---|---|---|
| `GET /api/admin/roles` | [listarRoles](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/admin.controller.js#L220) · [cargar](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/client/src/pages/Administracion.jsx#L29) | Lista roles ordenados por nombre y devuelve también los permisos admitidos. La API exige `roles:gestionar` o Administrador. El listado se usa para mostrar roles, elegir qué editar y elegir qué asignar. |
| `POST /api/ia/rutinas/:id/adaptar` | [modificarRutinaIA](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/ia.controller.js#L265) · [validación de historial](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/ia.controller.js#L142) | Reutiliza `generarRutinaIA`. Si hay una rutina a adaptar y no hay entrenamientos completos en el historial del usuario, responde 409 antes de llamar a Cohere. Con historial, la adaptación exitosa conserva el id y registra `CU019_ADAPTAR_RUTINA`. |
| `POST /api/ia/dietas/:id/adaptar` | [modificarDietaIA](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/controllers/dietas-ia.controller.js#L250) | Adaptar dieta ya existía. El guardado ahora registra `CU026_ADAPTAR_DIETA`. La condición de entrenamiento completo corresponde a la ruta de adaptar rutina. |

## Cómo mostrarlo

1. Abrí Roles y permisos como administrador. Mostrá el GET y compará la respuesta con una cuenta sin el permiso, que recibe 403.
2. Prepará una cuenta con consentimiento, medidas, objetivo activo y rutina propia, pero sin sesiones completas. Pedí adaptar y mostrá el 409.
3. Completá un entrenamiento con Iván y repetí, si está disponible Cohere con una clave de prueba. Mostrá que se mantiene el id y coordiná con Mateo para verificar el evento.

## Preguntas que te pueden hacer

**¿Por qué la generación de una rutina nueva no requiere entrenamientos previos?** La condición adicional se aplica cuando hay una rutina existente a adaptar. La creación nueva parte de datos del usuario y su objetivo.

**¿Quién controla el permiso para consultar roles?** `verificarPermiso` se ejecuta en la ruta antes de `listarRoles`. React también decide si muestra la sección.

Volvé al [reparto y orden del ensayo](README.md).
