### 1. Construir la imagen del Backend (API)

cd src\api
docker build -t lab/api .

### 2. Construir la imagen del Frontend (Web)

cd ..\web
docker build -t lab/web .
cd ..\..\iac

## Paso 2: Despliegue con Terraform

### 1. Inicializar Terraform

Dentro de la carpeta `iac`, inicializa el proyecto:
terraform init

### 2. Gestionar Workspaces

**Crear los workspaces (solo la primera vez):**
terraform workspace new dev
terraform workspace new qa

**Cambiar de workspace:**
Para desplegar en desarrollo:
terraform workspace select dev
Para desplegar en QA:
terraform workspace select qa
