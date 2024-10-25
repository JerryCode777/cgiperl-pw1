# Proyecto: Buscar y Reemplazar Palabras

Este proyecto implementa un formulario en una página web que permite ingresar un párrafo, buscar una palabra específica y reemplazarla por otra, utilizando un script CGI en Perl. El formulario está basado en el método GET y se procesan los datos para realizar el reemplazo en el párrafo proporcionado.

## Estructura del proyecto

El proyecto tiene la siguiente estructura de archivos y directorios:


## Archivos principales

- **cgi-bin/reemplazar.pl**: Este script CGI en Perl procesa los datos enviados desde el formulario y realiza la búsqueda y reemplazo de palabras en el párrafo proporcionado. La palabra reemplazada se muestra en un cuadro centrado.
  
- **css/mystyle.css**: Contiene los estilos utilizados en la página web para darle un aspecto agradable y una disposición clara.

- **index.html**: Es la página web principal donde se muestra el formulario al usuario. Permite ingresar el párrafo, la palabra a buscar y la palabra por la que se quiere reemplazar.

## Instrucciones de uso

1. **Subir el proyecto a un servidor compatible con CGI (Common Gateway Interface)**:
    - El archivo `reemplazar.pl` debe estar ubicado dentro del directorio `cgi-bin` del servidor.
    - El servidor debe estar configurado para ejecutar scripts CGI.
    - El archivo debe tener permisos de ejecución: `chmod +x reemplazar.pl`.

2. **Acceder a la página web**:
    - Abrir el archivo `index.html` en el navegador.
    - Llenar el formulario con un párrafo, la palabra a buscar y la palabra de reemplazo.

3. **Procesamiento**:
    - Al enviar el formulario, el script `reemplazar.pl` procesará los datos y mostrará el párrafo modificado en la misma página web dentro de un cuadro centrado.

## Imágenes

Las imágenes contenidas en el directorio `img` se utilizan para mostrar certificaciones de validación del código CSS y HTML5, además de cumplir con las normativas de accesibilidad WCAG 2.2 AAA.

## Despliegue con Docker

El archivo `dockerfile5.txt` contiene las instrucciones necesarias para construir una imagen Docker y desplegar el proyecto en un contenedor.

1. **Crear la imagen Docker**:
    ```
    docker build -t buscar-reemplazar -f dockerfile5.txt .
    ```

2. **Ejecutar el contenedor**:
    ```
    docker run -d -p 8080:80 buscar-reemplazar
    ```

3. **Acceder a la aplicación**:
    Abrir el navegador en `http://localhost:8080/index.html`.

## Créditos

Proyecto realizado por **Escobedo Quispe, Richart Smith** para el laboratorio de Programación Web, Grupo Z. 

© 2024.
