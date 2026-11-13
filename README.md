# Instalación de GYM-OS

Requisitos: Node.js 22.12 o posterior, npm y Docker con Docker Compose.

1. Descargar el proyecto y entrar a la carpeta:

   ```bash
   git clone https://github.com/SimonCastellani/GYM-OS-Final.git
   cd GYM-OS-Final
   ```

2. Instalar las dependencias:

   ```bash
   npm ci
   npm ci --prefix client
   ```

3. Copiar `.env.example` como `.env`. Completar `DB_PASSWORD` y `MYSQL_ROOT_PASSWORD` con contraseñas propias. Generar un valor para `JWT_SECRET` y otro distinto para `ENCRYPTION_KEY`, ejecutando este comando dos veces:

   ```bash
   node -e "console.log(require('node:crypto').randomBytes(32).toString('hex'))"
   ```

4. Con Docker iniciado, levantar la base y el correo de prueba:

   ```bash
   docker compose up -d
   docker compose ps
   ```

   Esperar a que MySQL figure como `healthy`. Los puertos 5176, 3312, 1026 y 8026 deben estar libres.

5. Preparar la base de datos:

   ```bash
   npm run db:iniciar
   ```

6. Compilar e iniciar la aplicación:

   ```bash
   npm run build
   npm start
   ```

7. Abrir http://localhost:5176 y crear una cuenta.

Para habilitar la IA, completar `COHERE_API_KEY` en `.env` y activar el consentimiento en Mi cuenta. Reiniciar la aplicación después de cambiar `.env`.

Para probar la recuperación de contraseña, configurar estos valores en `.env` antes de iniciar la aplicación:

```dotenv
SMTP_HOST=127.0.0.1
SMTP_PORT=1026
SMTP_SECURE=false
SMTP_FROM=no-reply@gymos.local
APP_URL=http://localhost:5176
```

Los correos de prueba se consultan en http://localhost:8026; no se envían a casillas reales.

Para crear un administrador, completar `ADMIN_EMAIL` y `ADMIN_PASSWORD` en `.env` y ejecutar `npm run admin:crear`.
