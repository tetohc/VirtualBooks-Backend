# 📚 Backend - Leyendas Costarricenses

Una API construida en **Python + FastAPI** sobre libro virtual de leyendas costarricenses. Utiliza una arquitectura en capas, persiste datos con **SQLAlchemy**, permite subir imágenes a **Cloudinary**, y protege todos los endpoints con autenticación **JWT**.

---

## 🚀 Tecnologías Utilizadas

- FastAPI
- SQLAlchemy
- Arquitectura por capas (routers, services, repositories)
- JWT para autenticación
- Cloudinary (subida de imágenes)
- Python

---

## 🔐 Autenticación

La API requiere autenticación vía JWT para realizar **cualquier petición**.  
Debes hacer login con correo y contraseña para obtener tu **token**.  
Este token debe enviarse en el header `Authorization` con el formato:
Authorization: Bearer <tu_token>
---

## 🛠️ Endpoints

### 📦 Auth

| Método | Endpoint        | Descripción |
|--------|-----------------|-------------|
| POST   | `/auth/create`  | Crear nuevo usuario |
| POST   | `/auth/login`   | Login y obtención de token JWT |

---

### 🌍 Provincias, Cantones y Distritos

| Método | Endpoint                     | Descripción                     |
|--------|------------------------------|---------------------------------|
| GET    | `/provinces/`               | Obtener todas las provincias    |
| GET    | `/cantons/{province_id}`    | Cantones por ID de provincia    |
| GET    | `/districts/{canton_id}`    | Distritos por ID de cantón      |

---

### 🏷️ Categorías

| Método | Endpoint         | Descripción         |
|--------|------------------|---------------------|
| GET    | `/categories/`   | Obtener todas las categorías |

---

### 📖 Leyendas

| Método | Endpoint                          | Descripción                      |
|--------|-----------------------------------|----------------------------------|
| POST   | `/legends/create`                 | Crear nueva leyenda              |
| PUT    | `/legends/update/{legend_id}`     | Actualizar leyenda               |
| DELETE | `/legends/{legend_id}`            | Eliminar leyenda por ID          |
| GET    | `/legends/{legend_id}`            | Obtener leyenda por ID           |
| GET    | `/legends/detail/{legend_id}`     | Obtener detalle de una leyenda      |
| GET    | `/legends/`                       | Listar todas las leyendas        |

---

### 🖼️ Imágenes

| Método | Endpoint           | Descripción            |
|--------|--------------------|------------------------|
| POST   | `/images/upload`   | Subir imagen a Cloudinary |

---
## Instalación

### 📥 Clona el repositorio

```bash
git clone https://github.com/tetohc/4thewords_backend_jerry_hurtado.git
cd 4thewords_backend_jerry_hurtado
```

### 🧪Crea y activa el entorno virtual
```
python -m venv venv
source venv/bin/activate
```
En Windows: venv\Scripts\activate

### 📦 Instala las dependencias
```
pip install -r requirements.txt
```

### ⚙️ Crea el archivo .env
Crea un archivo .env en la raíz del proyecto con esta estructura básica:
```
JWT_SECRET_KEY=tu_clave_secreta
CLOUDINARY_CLOUD_NAME=tu_nombre_cloudinary
CLOUDINARY_API_KEY=tu_api_key
CLOUDINARY_API_SECRET=tu_api_secret
DATABASE_URL=tu conexión real
```
Copia .env.example a .env y completa los valores con tus datos personales.

### ▶️ Ejecutar el proyecto

Usa el siguiente comando en la terminal:

```bash
python .\main.py
```
El proyecto se levantará en el puerto 8080.

### 🔎 Verifica que todo esté funcionando
- Abre el navegador en http://localhost:8080/docs
- Deberías ver la documentación de Swagger para el API.