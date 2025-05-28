# Documento de Arquitectura - Reto Final DevOps

## Información general

- **Nombre del proyecto**: Reto Final DevOps - Aplicación web con Flask y Docker  
- **Autor**: Mario Aroca Páez  
- **Fecha**: Abril 2025  
- **Curso**: Bootcamp DevOps - Qualentum  

---

## 1. Arquitectura del Sistema

### 1.1 Descripción

La solución consiste en una aplicación web API desarrollada en Python utilizando Flask y SQLAlchemy.  
Permite insertar, consultar y eliminar datos a través de endpoints HTTP RESTful.

La base de datos utilizada en entorno local es SQLite, contenida en el mismo contenedor.  
La estructura está preparada para ser reemplazada por PostgreSQL u otro motor en producción.

### 1.2 Estructura de la app

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

- `run.py`: Punto de entrada de la app  
- `app/`: Código principal con configuración, modelos y rutas  
- `.env`: Variables de entorno  
- `Dockerfile`: Entorno de ejecución basado en Docker  

---

## 2. Arquitectura Cloud (propuesta)

La aplicación está preparada para su despliegue en un entorno cloud basado en contenedores.

### 2.1 Proveedor propuesto

**Amazon Web Services (AWS)** con:

- **ECS / EC2**: para ejecución de contenedores
- **RDS**: para base de datos en producción
- **S3**: para almacenamiento de logs o backups (opcional)

### 2.2 Pipeline propuesto

1. GitHub como repositorio de código fuente
2. GitHub Actions como sistema CI/CD
3. Docker Hub (opcional) como registro de imágenes
4. Despliegue a AWS tras validación

### 2.3 Diagrama de arquitectura

```
[ GitHub ] 
   ↓
[ GitHub Actions CI ]
   ↓
[ Docker Image ]
   ↓
[ AWS ECS / EC2 ]
```

---

## 3. Ciclo de Vida del Desarrollo

### 3.1 Desarrollo local

- El desarrollador clona el repo y trabaja localmente en un contenedor Docker.
- Las dependencias se instalan desde `requirements.txt`.
- La aplicación se ejecuta sobre SQLite con datos persistentes locales.

### 3.2 Integración Continua (CI)

- Se recomienda configurar GitHub Actions para lanzar tests automáticos tras cada `push`.
- Se construye y valida una imagen Docker lista para despliegue.

### 3.3 Despliegue (CD)

- Se publica la imagen en Docker Hub o AWS ECR.
- Se despliega automáticamente a ECS o EC2.
- En producción se conecta a una base de datos PostgreSQL (por ejemplo, en RDS).

---

## 4. Gestión de Configuración

Se utilizan variables de entorno para manejar la configuración:

- En desarrollo: `.env`
- En producción: variables inyectadas desde ECS o Docker Secrets

Ejemplo:

```
ENV=development
SQLALCHEMY_DATABASE_URI=sqlite:///db.sqlite3
SECRET_KEY=supersecret
```

---

## 5. Escalabilidad y mejoras futuras

La arquitectura propuesta es fácilmente escalable:

- Soporte para PostgreSQL en producción
- Uso de Alembic para gestión de migraciones
- CI/CD completo con tests y despliegue automático
- Añadir cacheo con Redis
- Añadir Gunicorn y Nginx para despliegue productivo

---

## 6. Conclusión

Esta solución propone una arquitectura clara, simple y escalable para una aplicación web Python.  
Facilita el desarrollo local en contenedores, está lista para producción en la nube,  
y sigue buenas prácticas DevOps que permiten su evolución hacia entornos CI/CD automatizados y escalables.

---
