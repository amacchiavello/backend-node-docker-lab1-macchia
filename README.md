## Description

Proyecto de laboratorio para la docker compose

## Alcance del proyecto

Laboratorio 1 - Mi stack en docker compose  

El siguiente desafío te permitirá levantar una aplicación junto a su base de datos, utilizando 
docker compose como herramienta de desarrollo. El desafío es el siguiente: 

A partir del siguiente repositorio de proyecto,crea tu fork personal para trabajar: 
https://github.com/carlosmarind/backend-node-docker-lab1 

Crear un docker-compose en la carpeta del proyecto,  que comprenda la ejecución de 2 
aplicaciones en el: 

1. Aplicación de repositorio: 

a. La aplicación del repositorio en compose debe considerar usar tanto una 
imagen como el dockerfile para construir nuevamente la imagen en caso de 
que lo queramos. 

b. La aplicación debe considerar el uso de variables de ambiente para la 
configuración de conexión a base de datos y estas no deben quedar escritas 
dentro del compose. 

2. Base de datos: 

a. El compose debe considerar también la configuración de base de datos 
asociada a la aplicación, en esta oportunidad debes utilizar mysql en versión 
9.4 

b. Debes identificar las variables de entorno que utiliza mysql para su 
uso/configuración 

c. Para mysql debes usar un volumen nombrado mediante compose,el cual 
asegure persistencia entre subidas y bajadas del compose. 
Una vez levantada la aplicación completa mediante compose, debes ejecutar el siguiente 
script en tu base de datos para crear la aplicación inicial 

CREATE TABLE usuarios ( 
id INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(255) NULL, 
edad INT NULL, 
created_at DATE NULL, 
updated_at DATE NULL, 
PRIMARY KEY (id) 
);


## Support

No tiene...

## Stay in touch

- Author - [Andres Macchiavello]

## License

Utiliza las siguientes imagenes desde el repositorio Github

imagen: node:22:18

imagen: mysql:9.4

imagen: https://github.com/users/amacchiavello/packages/container/package/backend-node-docker-lab1-macchia:lab-1


## Secretos necesarios

Antes de ejecutar `docker compose up`, debes crear los siguientes secretos, te posicionas en la raiz y actualizas los secretos,
o puedes usar los archivos que vienen por default, los string contenidos en los secretos son referenciales, por seguridad se recomienda cambiarlos:


echo "tuusuario" > secreto_usuario.txt

echo "tupassword" > secreto_password.txt

echo "tubasededatos" > secreto_base.txt


## configuracion infra

Para levantar la infraestructura utilizando docker compose debemos:

    docker compose up -d

Para levantar la infraestructura utilizando docker compose y reconstruir la imagen de la aplicacion debemos:

    docker compose up -d --build

Si queremos bajar la infraestructura pero conservar los volumenes con las configuraciones de la aplicacion:

    docker compose down

En cambio, si queremos bajar la infraestructura y ademas eliminar los volumenes, lo hacemos con:

    docker compose  down -v

La tabla necesaria para que funcione la aplicación se crea si no existe en la base que ocupará el aplicativo.


## Para probar la aplicacion se utilizan los siguientes comandos

Creación de usuarios: 

curl -X POST http://localhost:3000/users -H "Content-Type: application/json" -d '{"nombre":"Carlos López","edad":28}' 


Listado de usuarios: 

curl http://localhost:3000/users