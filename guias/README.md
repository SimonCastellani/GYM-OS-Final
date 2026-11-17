# GYM-OS · Reparto y guías de defensa del 100 %

Cada integrante tiene un bloque para revisar, probar y explicar. La continuidad sale de los repartos de las preentregas. Las guías asignan la defensa de cada avance; la autoría se acredita con los aportes que el equipo pueda respaldar.

La principal incorporación del 90 % al 100 % es la gestión de roles personalizados (CU033–CU036). Se agregaron cinco rutas: listado, creación, edición, baja y asignación. El cierre también suma bitácora, validaciones de nutrición e IA, historial de entrenamientos, progreso y dígitos verificadores. Se comparó el 90 % publicado (`866a74e`) con el final publicado (`67cba93`).

| Integrante | Responsabilidad principal del 100 % |
|---|---|
| [Gianluca Pizarro](01-gianluca-pizarro.md) | Cierre de sesión y recuperación con bitácora |
| [Tomás Menossi](02-tomas-menossi.md) | Asistente del 100 % y registro de planes nuevos con IA |
| [Iván Lerner](03-ivan-lerner.md) | Historial por fecha y comprobación de guardados |
| [Paulo López Stanley](04-paulo-lopez.md) | Formulario de roles y edición de dietas |
| [Gade Silva y Lápiz](05-gade-silva-y-lapiz.md) | Asignación de roles y alta de comidas sin duplicados |
| [Valentín Sued (Sueco)](06-valentin-sued.md) | Bajas protegidas y bitácora de rutinas manuales |
| [Mateo Romani](07-mateo-romani.md) | Comparación de peso inicial y actual, y dígitos verificadores |
| [Joaquín Casanou](08-joaquin-casanou.md) | Consulta de roles y validación previa a adaptar planes |
| [Simón Castellani](09-simon-castellani.md) | Creación y edición de roles personalizados en el servidor |

## Continuidad de las cuatro preentregas

| Integrante | 25 % · base inicial | 50 % | 75 % | 90 % |
|---|---|---|---|---|
| Gianluca Pizarro | Servidor, configuración y errores de la API. | Registro, login, logout y salud. | Validación de alimentos y baja de consumos. La ampliación le asignó recuperación por correo. | Cuentas, recuperación y bloqueo temporal del login. |
| Tomás Menossi | Conexión MySQL y preparación del entorno. | Chat con Cohere e historial de conversaciones. | Generación de rutinas con IA. | Chat y generación de rutinas y dietas con IA. |
| Iván Lerner | Modelo Usuario, campos y persistencia. | Registro e historial de entrenamientos. | Creación manual de dietas. | Entrenamientos, alta de dietas y alta/listado de usuarios en Administración. |
| Paulo López Stanley | Roles, tabla intermedia y relaciones de MySQL. | Objetivos personales y sus rutas. | Edición de dietas. | Frontend de Objetivos y edición de dietas y usuarios. |
| Gade Silva y Lápiz | Registro y transacción usuario–rol. | Medidas y perfil físico. | Alta de consumos y agregado de alimentos. | Medidas, registro de consumos y bloqueo/activación de usuarios. |
| Valentín Sued (Sueco) | Protección de contraseñas y tokens. | Alta, edición y baja de rutinas manuales. | Consulta y baja de dietas, editor de comidas. | Rutinas manuales y gestión visual de dietas. |
| Mateo Romani | Login y actualización de última conexión. | Resumen y cálculo de progreso. | Macros diarios y metas nutricionales. | Progreso, macros diarios y panel de bitácora. |
| Joaquín Casanou | Persistencia, vencimiento y revocación de sesiones. | Catálogo de ejercicios y consulta de rutinas. | Adaptación de rutinas con IA. | Catálogo y adaptación de rutinas y dietas con IA. |
| Simón Castellani | Validaciones, rutas y demostración HTTP. | Mi cuenta y datos personales. | Edición de consumos y alimentos. | Perfil, cambio de contraseña y bajas de cuentas. |

La base inicial se identificó por el alcance de cuentas y el reparto de `Proyecto-Gym-OS`. Algunas guías antiguas escriben los nombres de forma distinta; acá se usa la grafía de la guía del 90 %.

## Quién explica cada ruta nueva de roles

| Ruta | Responsable principal | Qué muestra |
|---|---|---|
| `GET /api/admin/roles` | Joaquín | Listado, permisos disponibles y acceso. |
| `POST /api/admin/roles` | Simón | Crear una definición, validar y registrar el alta. |
| `PUT /api/admin/roles/:id` | Simón | Editar una definición y proteger los roles del sistema. |
| `PUT /api/admin/usuarios/:id/roles` | Gade | Reemplazar asignaciones y cerrar sesiones del usuario afectado. |
| `DELETE /api/admin/roles/:id` | Valentín | Rechazar bajas de roles asignados o protegidos y borrar un rol libre. |

Paulo explica el formulario React de alta y edición. [Rutas en el código final](https://github.com/SimonCastellani/GYM-OS-Final/blob/67cba939d9363d6c3b3eb9b4726249f61e1b64ff/backend/routes/admin.routes.js#L32)

## Cómo ensayar juntos

1. **Gianluca** verifica que esté corriendo la versión final y muestra un cierre de sesión. Dejen abiertas una cuenta administradora y una cuenta común de prueba en perfiles de navegador separados.
2. **Joaquín** muestra la consulta de roles. **Paulo** abre el formulario. **Simón** crea y edita un rol de prueba. **Gade** lo asigna a la cuenta común. **Valentín** intenta borrarlo mientras está asignado y después de quitar esa asignación.
3. **Iván** muestra el filtro por fecha y cierra una sesión de entrenamiento. **Tomás** explica el chat o la generación de un plan nuevo. **Joaquín** muestra el requisito del historial para adaptar una rutina.
4. **Gade** prueba el rechazo de un consumo duplicado al darlo de alta. **Mateo** cierra con la comparación de peso inicial y actual y una consulta del DVV.

Cada persona prepara un caso correcto, uno que se rechaza o se cancela y una explicación breve de pantalla → ruta → función → datos. Usen cuentas y registros de prueba. Para IA hace falta Cohere configurado y consentimiento; para recuperación usen el buzón local. Cada integrante registra lo que efectivamente comprobó.

Para una base ya instalada, corré `npm run db:iniciar` con el código final antes de la demo de integridad. El DER actualizado mantiene las 17 tablas. La variante que consolidaba cinco tablas quedó fuera de la versión final.

## Fuentes

- [Base inicial de cuentas y reparto](https://github.com/tomimeno0/Proyecto-Gym-OS/blob/79f14621401963da509538bb34c4ffd89a779d78/REPARTO.md)
- [Guías del 50 %](https://github.com/tomimeno0/GYM-OS-Preentrega/tree/39ac82c8f3ce62f30fb47fcd7558d093a9f4ee11/guias)
- [Guías del 75 %](https://github.com/tomimeno0/GYM-OS-Preentrega-75/tree/b690cdc80f5d77a49c708b9e0257dcfb259d37e6/guias)
- [Guías del 90 %](https://github.com/tomimeno0/GYM-OS-Preentrega-90/tree/866a74e9ed3dc257f174062e2b1bcf02679cb449/guias)
- [Alcance del 90 %](https://github.com/tomimeno0/GYM-OS-Preentrega-90/blob/866a74e9ed3dc257f174062e2b1bcf02679cb449/docs/ALCANCE.md)
- [Reparto previsto para el 100 %](https://github.com/tomimeno0/GYM-OS-Final/blob/c089b64acf34b1b778ba38a96fc9ea61ea8a1d90/guias/README.md)
- [Código final comparado](https://github.com/SimonCastellani/GYM-OS-Final/tree/67cba939d9363d6c3b3eb9b4726249f61e1b64ff)
