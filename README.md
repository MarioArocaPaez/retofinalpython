# 🧪 Reto Final DevOps - Qualentum Bootcamp

Este proyecto es el trabajo final del Bootcamp DevOps de **Qualentum**, en el que se pone en práctica todo lo aprendido durante el curso: diseño de arquitectura, entornos de desarrollo, contenedores, despliegue y automatización.

---

## 📌 Descripción del Proyecto

La aplicación es una **web API en Python con Flask**, organizada por módulos y conectada a una base de datos (en local usamos SQLite). Está lista para ser contenida en Docker y fácilmente desplegable en un entorno cloud.

---

## 🧱 Estructura del Proyecto

```
reto_final_python/
├── app/
│   ├── __init__.py
│   ├── config.py
│   ├── models.py
│   └── routes.py
├── .env
├── Dockerfile
├── manage.py
├── manage.sh
├── requirements.txt
└── run.py
```

---

## ⚙️ Arquitectura Técnica

- **Lenguaje**: Python 3.9
- **Framework**: Flask + Flask_SQLAlchemy
- **Base de datos**: SQLite en entorno local (preparado para PostgreSQL u otros en producción)
- **Contenedores**: Docker
- **Pipeline recomendado**: GitHub Actions para CI/CD
- **Despliegue recomendado**: AWS (EC2, ECS, EKS o similar)

---

## 🚀 Cómo ejecutar en local con Docker

### ✅ Requisitos

- Docker instalado
- No es necesario tener Python o dependencias instaladas en el sistema

### 🔧 1. Clonar el repositorio

```
git clone https://github.com/MarioArocaPaez/retofinalpython.git
cd retofinalpython
```

### 📄 2. Crear el archivo `.env`

```
ENV=dev
SQLALCHEMY_DATABASE_URI=sqlite:///db.sqlite3
```

### 🐳 3. Construir la imagen Docker

```
sudo docker build -t reto_final_app .
```

### ▶️ 4. Ejecutar el contenedor

```
sudo docker run -p 5000:5000 reto_final_app
```

La app estará disponible en:  
http://localhost:5000

---

## 📦 Variables de entorno

| Variable                    | Descripción                                     |
|----------------------------|-------------------------------------------------|
| `ENV`                      | Entorno de ejecución (`dev`, `prod`, etc)       |
| `SQLALCHEMY_DATABASE_URI`  | URI de conexión a base de datos SQLAlchemy      |

---

## 📈 Mejoras futuras (ideas)

- Implementar CI/CD con GitHub Actions
- Añadir tests con Pytest + Coverage
- Despliegue automático en AWS usando Terraform o Ansible
- Soporte para PostgreSQL o MySQL
- Docker Compose con base de datos en servicio separado

---

## 📽️ Video de explicación

[🔗 Enlace al vídeo explicativo](https://github.com/MarioArocaPaez/retofinalpython/blob/master/video.mp4) 

---

## 👨‍💻 Autor

**Mario Aroca Páez**  
Proyecto final del [Bootcamp DevOps - Qualentum](https://qualentum.com)

---
