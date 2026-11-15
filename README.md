# Trabajo Práctico Integrador - Computación Aplicada

Universidad de Palermo

## Integrantes

- Julian Rallo
- Tomás Magnani Moles

**Correo de contacto:** julianrallo02@gmail.com

## Descripción

En este trabajo práctico configuramos un servidor Debian 12 para alojar una página web que muestra información de alumnos y sus calificaciones.

También configuramos una base de datos, particiones de almacenamiento y un sistema de copias de seguridad automáticas.

## Tecnologías utilizadas

- Debian GNU/Linux 12
- Apache2
- PHP
- MariaDB
- Bash
- Cron
- SSH
- Git y GitHub

## Configuración del servidor

Configuramos Apache2 para servir el sitio web desde `/www_dir`.

La aplicación utiliza PHP y MariaDB para mostrar los datos de los alumnos.

Creamos dos particiones independientes:

- `/www_dir`: archivos del sitio web.
- `/backup_dir`: almacenamiento de copias de seguridad.

Las particiones se configuraron en `/etc/fstab` para que se monten automáticamente al iniciar el sistema.

## Copias de seguridad

Creamos el script `backup_full.sh`, que recibe una carpeta de origen y otra de destino.

El script genera un archivo comprimido con la fecha del respaldo.

Ejemplo de uso:

    ./backup_full.sh /var/log /backup_dir

## Backups automáticos

Configuramos Cron para ejecutar dos tareas:

- Todos los días a las 00:00: backup de `/var/log`.
- Lunes, miércoles y viernes a las 23:00: backup de `/www_dir`.

## Archivos del proyecto

- `index.php`: página web de alumnos.
- `db.sql`: base de datos del proyecto.
- `apache.conf`: configuración de Apache.
- `backup_full.sh`: script de copias de seguridad.
- `cron.txt`: programación de tareas automáticas.

## Seguridad

La contraseña real de MariaDB no se publica en este repositorio. Para utilizar el proyecto es necesario configurar las credenciales de la base de datos en el entorno correspondiente.

## Autores

Julian Rallo y Tomás Magnani Moles

Universidad de Palermo - 2026

