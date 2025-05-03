# Introducción
Frontend para la prueba técnica de INVERSIVA

## Tecnologías utilizadas
Flutter como framework

## Estructura de carpetas
El proyecto está dividido en las siguientes carpetas:
- ui: aquí solo habrían widgets de interfaz si lógica
- screens: son aquellas pantallas que se usan en la aplicación
- features: se refiere a cada recurso dentro de la aplicación, como los "users"

## Arquitectura
La aplicación se compone de una aquitectura BLoC - Repositorio - Datasource
Básicamente el objetivo es que hayan BLoCs por vista, dejando la capa repositorio
como una capa que permite reactividad dentro de la aplicación. Finalmente la capa
datasource es la encargada de proveer los datos necesarios, ya sean mockeado, remoto
o inclusive locales si hubiesemos necesitado implementar una base de datos local.

## Puntos a mejorar
- Falta implementar la actualización y creación del usuario con un rol dinámico. No me ha dado tiempo.
- He diseñado la aplicación para hacer uso de FlutterCachedQuery para tener reactividad en toda la aplicación,
pero no me ha dado tiempo a implementarlo. En su lugar, hubiese usado GetIt como framework de injección de dependencias,
para asegurarme que el repositorio solo se crea una únicamente, de tal forma que podría gestionar las diferentes acciones
del crud manteniendo la aplicación reactiva (Necesitaba mucho código de configuración para esto)
- He metido un desplegable para cada usuario. Visualmente el chevron no cambia de dirección, ya que lo he dejado para el final
y no le he dedicado tiempo.
- No le he podido dedicar tiempo al paginado

## A tener en cuenta
El archivo globals.dart contiene la URL base para hacer las peticiones
