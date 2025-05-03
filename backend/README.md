# Introducción
Backend para la prueba técnica de INVERSIVA

## Tecnologías utilizadas
NodeJs para ejecutar el backend, Sequalize como ORM y Mysql como base de datos.
He utilizado dotenv para gestionar el acceso a la base de datos. Revisar el archivo src/config

## Arquitectura
La aplicación se ejecuta en una arquitectura de 3 capas. Todo empieza en el archivo src/index,
donde se inicializa la base de datos y se redirigen las peticiones a los controladores pertinentes.

El controlador se encarga de llamar al servicio correspondiente para delegar la query.
El servicio llama al repositorio y es este último el que accede a la base de datos.

Las peticiones de esta prueba no han requerido manejo de negocio en la capa de servicio.

## Puntos a mejorar
- No he podido gestionar adecuadamente los errores.
- Faltaría validar los datos que entran por la consulta, tantl el body como los parámetros.
- He mantenido los roles del usuario como integers, los cuales se podrían refactorizar para
tener un formato más legible.
- Las respuestas del servidor son muy básicas y se deberían de mejorar.

## A tener en cuenta
Revisar el archivo src/config.ts para manejar el acceso a la base de datos
