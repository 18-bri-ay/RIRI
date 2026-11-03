# RIRI – Sistema de Análisis y Comparación Biométrica

**Versión:** 1.0.0  
**Tipo de proyecto:** Aplicación móvil  
**Plataforma:** Android  
**Modalidad:** Proyecto de innovación tecnológica – Hackathon  

---

## 1. Descripción del proyecto

RIRI es una aplicación móvil desarrollada con el propósito de apoyar los procesos de búsqueda e identificación de personas desaparecidas mediante el uso de tecnologías de análisis y comparación biométrica.

El sistema está diseñado para facilitar el registro de personas desaparecidas y posibles avistamientos, permitiendo comparar información facial mediante una API de análisis biométrico conectada a una base de datos.

RIRI busca proporcionar una herramienta tecnológica de apoyo para administradores autorizados, contribuyendo a la innovación en los procesos de identificación y búsqueda de personas.

---

## 2. Objetivo general

Desarrollar una aplicación móvil que permita registrar, administrar y comparar información biométrica de personas desaparecidas y posibles avistamientos, mediante tecnologías de reconocimiento facial y almacenamiento de datos, con el propósito de apoyar los procesos de identificación.

---

## 3. Funcionalidades principales

### Acceso administrativo
* Inicio de sesión mediante credenciales asignadas.
* Acceso destinado a administradores autorizados.
* Interfaz de navegación para las funcionalidades del sistema.

### Registro de personas desaparecidas
* Captura y carga de fotografías.
* Registro de información asociada a la persona.
* Envío de información al servidor para su almacenamiento.

### Registro de avistamientos
* Captura o selección de fotografías de posibles avistamientos.
* Envío de información para su procesamiento.
* Consulta de posibles coincidencias.

### Análisis y comparación biométrica
* Comunicación con una API de análisis facial.
* Procesamiento de fotografías.
* Comparación con registros almacenados.
* Presentación de resultados de posibles coincidencias y porcentajes de similitud, según la respuesta del servicio.

> **Nota:** Los porcentajes de similitud son indicadores técnicos y no constituyen una confirmación definitiva de identidad.

---

## 4. Tecnologías utilizadas

### Aplicación móvil
* Flutter
* Dart
* Android Studio

### Comunicación y procesamiento
* API REST
* Solicitudes HTTP
* Intercambio de datos mediante JSON
* Backend desarrollado en Python
* Ngrok para la comunicación con el servidor durante las pruebas

### Almacenamiento
* Base de datos conectada al backend para administrar registros y resultados de comparación.

---

## 5. Arquitectura general

El funcionamiento de RIRI se organiza en las siguientes etapas:

1. El administrador inicia sesión en la aplicación.
2. Selecciona el módulo de registro de personas desaparecidas o avistamientos.
3. Captura o selecciona una fotografía e ingresa la información correspondiente.
4. La aplicación envía los datos al backend mediante una solicitud HTTP.
5. El servidor procesa y almacena la información.
6. El servicio de análisis biométrico realiza la comparación correspondiente.
7. La aplicación presenta los resultados proporcionados por la API.

---

## 6. Instalación

Para instalar RIRI en un dispositivo Android:

1. Acceder a la sección **Releases** del repositorio de GitHub.
2. Descargar el archivo APK correspondiente a la versión 1.0.0.
3. Abrir el archivo descargado desde el dispositivo Android.
4. Autorizar la instalación desde esa fuente cuando el sistema lo solicite.
5. Completar la instalación.
6. Abrir RIRI e ingresar las credenciales de prueba proporcionadas.

### Requisitos
* Dispositivo Android compatible con el APK.
* Conexión a Internet.
* Credenciales de acceso.
* Disponibilidad del servidor backend para utilizar las funciones conectadas.

---

## 7. Credenciales de prueba

Para fines de evaluación académica se dispone de una cuenta de demostración.

* **Usuario:** adm01penjamogto@riri.mx
* **Contraseña:** Proporcionada de manera privada al evaluador.
* **Referencia:** Consultar el documento `INSTRUCCIONES_ACCESO.md`.

---

## 8. Consideraciones de seguridad

RIRI trabaja con información potencialmente sensible, por lo que se recomienda:

* Utilizar únicamente datos ficticios o autorizados durante las demostraciones.
* Restringir el acceso a administradores autorizados.
* Evitar publicar contraseñas, claves de API y datos biométricos.
* Proteger las comunicaciones entre la aplicación y el servidor.
* No considerar las coincidencias biométricas como identificaciones definitivas sin verificación adicional.

---

## 9. Alcance de la versión 1.0.0

* La versión 1.0.0 corresponde a un prototipo funcional desarrollado para su presentación y evaluación académica durante un hackathon.
* Su propósito es demostrar la integración de una aplicación móvil con servicios de almacenamiento y análisis biométrico.
* El sistema no sustituye los procedimientos oficiales de identificación de personas ni las investigaciones realizadas por autoridades competentes.

---

## 10. Desarrolladores

* Juan Pablo Zaragoza Jiménez
* Brisa de la Luz Ayala López

*Proyecto desarrollado como una propuesta de innovación tecnológica con enfoque social.*

*RIRI – Tecnología e innovación al servicio de la identificación y búsqueda de personas.*