## Docker 馃悑

Docker es una plataforma abierta para desarrollo, entrega y operaci贸n de aplicaciones.

_Si ya tienes Docker instalado en tu m谩quina, por favor actual铆zalo con la versi贸n m谩s reciente_

### Instalaci贸n de Docker

Ve a la [documentaci贸n de instalaci贸n de Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

Luego sigue las instrucciones del tutorial para instalar Docker **usando el repositorio**. Hay 2 pasos:

- SET UP THE REPOSITORY. Esto significa configurar el repositorio
- INSTALL DOCKER ENGINE. Esto significa instalar el motor de Docker

Cuando termines, podr谩s ejecutar lo siguiente:

```bash
sudo service docker start
```

```bash
sudo docker run hello-world
```

Deber铆a aparecer el siguiente mensaje:

![](images/docker_hello.png)

```bash
sudo service docker stop
```
