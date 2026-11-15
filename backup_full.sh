#!/bin/bash

# Script de backup automatico
# Uso: backup_full.sh ORIGEN DESTINO

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Uso: $0 ORIGEN DESTINO"
    echo "Crea una copia comprimida de una carpeta."
    exit 0
fi

if [ "$#" -ne 2 ]; then
    echo "Error: debes indicar origen y destino."
    echo "Uso: $0 ORIGEN DESTINO"
    exit 1
fi

ORIGEN="$1"
DESTINO="$2"

if [ ! -d "$ORIGEN" ]; then
    echo "Error: no existe la carpeta de origen."
    exit 1
fi

if [ ! -d "$DESTINO" ]; then
    echo "Error: no existe la carpeta de destino."
    exit 1
fi

FECHA=$(date +%Y%m%d)
NOMBRE=$(basename "$ORIGEN")
ARCHIVO="$DESTINO/${NOMBRE}_bkp_${FECHA}.tar.gz"

tar -czf "$ARCHIVO" -C "$(dirname "$ORIGEN")" "$NOMBRE"

if [ $? -eq 0 ]; then
    echo "Backup creado correctamente: $ARCHIVO"
else
    echo "Error al crear el backup."
    exit 1
fi

