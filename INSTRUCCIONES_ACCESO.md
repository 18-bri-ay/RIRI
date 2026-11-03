# RIRI – Documento de Apoyo para Instalación y Evaluación

**Versión:** 1.0.0  
**Plataforma:** Android  
**Tipo de acceso:** Administrador de prueba  
**Propósito:** Evaluación académica del prototipo  
**Ubicación de referencia:** Pénjamo, Guanajuato, México  

---

## 1. Descripción

**RIRI** es una aplicación móvil diseñada para el registro de información sobre personas desaparecidas y posibles avistamientos. Además, integra un sistema de comparación biométrica mediante su conexión con un servidor backend.

---

## 2. Descarga e Instalación

Sigue estos pasos para instalar la aplicación en un dispositivo Android:

1. Ingresa al repositorio oficial de **RIRI** en GitHub.
2. Ve a la sección **Releases**.
3. Selecciona la versión **RIRI – Versión 1.0.0**.
4. Descarga el archivo `.apk`.
5. Localiza el archivo descargado en el gestor de archivos de tu dispositivo Android.
6. Abre el archivo y autoriza la instalación desde fuentes desconocidas si el sistema lo solicita.
7. Una vez completada la instalación, abre la aplicación.

---

## 3. Credenciales de Prueba

Para la evaluación académica se dispone de la siguiente cuenta con rol administrativo:

* **Correo electrónico:** `adm01penjamogto@riri.mx`
* **Contraseña:** *(Entregada directamente al profesor o evaluador)*
* **Rol:** Administrador de prueba

> **Nota:** Estas credenciales deben utilizarse exclusivamente para las pruebas autorizadas.

---

## 4. Procedimiento de Evaluación

### Prueba 1: Inicio de Sesión
1. Abrir la aplicación **RIRI**.
2. Esperar a que finalice la pantalla de bienvenida (Splash Screen).
3. Introducir el correo electrónico y la contraseña de prueba.
4. Presionar el botón para iniciar sesión.
5. Verificar el acceso a las funciones disponibles del panel.

### Prueba 2: Registro de Persona Desaparecida
1. Seleccionar la opción de registro de personas desaparecidas.
2. Completar los campos con la información solicitada.
3. Adjuntar una fotografía de prueba (**tamaño máximo: 8 MB**).
4. Guardar y continuar con el registro.
5. Verificar que los datos se almacenen correctamente.

### Prueba 3: Registro de Avistamiento
1. Acceder al módulo de registro de avistamientos.
2. Ingresar la información correspondiente al avistamiento.
3. Adjuntar una fotografía de prueba (**tamaño máximo: 8 MB**).
4. Enviar los datos.
5. Confirmar que el registro sea recibido por el servidor.

### Prueba 4: Comparación Biométrica
1. Registrar previamente una persona desaparecida utilizando una fotografía de prueba.
2. Realizar un registro de avistamiento usando **la misma fotografía**.
3. Ejecutar la opción de análisis biométrico.
4. Consultar la pantalla de resultados para verificar el porcentaje o datos de coincidencia devueltos por la API.

> **Observación:** La similitud obtenida dependerá de los criterios del servicio biométrico. No se garantiza un porcentaje específico.

---

## 5. Requisitos de Funcionamiento

Para ejecutar las pruebas sin inconvenientes se requiere:

* Dispositivo con sistema operativo Android compatible.
* Conexión activa a Internet.
* Servidor backend activo y accesible.
* Utilizar únicamente fotografías ficticias o previamente autorizadas.

---

## 6. Consideraciones Importantes

* Este proyecto es un **prototipo académico**.
* Las funciones de almacenamiento y comparación biométrica dependen 100% de la disponibilidad del servidor backend.
* Si el servidor se encuentra desconectado o la URL pública (ej. Ngrok) cambia, algunas funciones dejarán de responder.
* Los resultados arrojados por el módulo biométrico representan **posibles coincidencias** y no constituyen una identificación oficial.

---

## 7. Equipo Desarrollador

* **Juan Pablo Zaragoza Jiménez**
* **Brisa de la Luz Ayala López**