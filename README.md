# Fernando  De La Cruz - test Leasein

# Encontrar errores
En el archivo *encontrar_errores.php* se encuentra el código con los errores resueltos.

# Evaluación
En el archivo *Evaluacion.docx* se encuentran las respuestas de la evaluación.

# Backend
En la carpeta *backend* se encuentra el proyecto de Laravel. Es necesario tener *composer* para iniciarlo:
` cd backend `
` composer install `

Después es necesario copiar el archivo *.env.prod* y renombrarlo a *.env* y cambiar los siguientes valores por los del host actual:

```
	DB_CONNECTION=mysql
	DB_HOST=127.0.0.1
	DB_PORT=3306
	DB_DATABASE=testdb
	DB_USERNAME=user
	DB_PASSWORD=key
```
Después iniciamos el servidor con:
` php artisan serve `

# Frontend
En la carpeta *frontend* se encuentra el proyecto de React. Es necesario tener *npm* para iniciarlo.
` cd frontend `
` npm install `

Después es necesario copiar el archivo *.env.prod* y renombrarlo a *.env* y cambiar los siguientes valores por los del host actual:
` REACT_APP_URL=http://127.0.0.1:8000/api/ `