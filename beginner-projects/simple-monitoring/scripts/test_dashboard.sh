#!/bin/bash

# Verifica si jq está instalado
if ! command -v jq &> /dev/null
then
    echo "❌ jq no está instalado. Instálalo usando 'sudo apt-get install jq'."
    exit 1
fi

if ! command -v stress &> /dev/null
then
    echo "❌ stress no está instalado. Instálalo usando 'sudo apt-get install stress'."
    exit 1
fi

# URL de la API de Netdata
NETDATA_URL="http://localhost:19999/api/v1/data?chart=system.cpu"

# Intervalo en segundos entre cada actualización
INTERVAL=1

# Simular carga de CPU (usa 2 núcleos durante 60 segundos)
echo "🚀 Generando carga en el CPU..."
stress --cpu 2 --timeout 60 &  # Puedes cambiar el número de núcleos o el tiempo de carga

# Bucle para monitorear el uso de la CPU en tiempo real
while true
do
    # Obtener datos de la API de Netdata
    DATA=$(curl -s "$NETDATA_URL")

    # Verificar si se obtuvo la respuesta
    if [[ -z "$DATA" ]]; then
        echo "❌ No se obtuvo respuesta de la API de Netdata."
        exit 1
    fi

    # Extraer las etiquetas de las métricas (labels)
    COLUMNS=$(echo "$DATA" | jq -r '.labels[]')

    # Extraer la última fila de "data" (últimos valores)
    VALUES=$(echo "$DATA" | jq -r '.data | last | .[]')

    # Verificar si se obtuvieron valores
    if [[ -z "$VALUES" ]]; then
        echo "❌ No se encontraron valores de CPU. Verifica que Netdata esté recolectando datos correctamente."
        exit 1
    fi

    # Extraer el valor de 'time' por separado
    TIME=$(echo "$VALUES" | head -n 1)
    VALUES=$(echo "$VALUES" | tail -n +2)  # Eliminar el valor de 'time' de la lista de valores

    # Mostrar la información
    echo "📊 Uso de CPU (última actualización: $TIME)"

    # Imprimir las etiquetas (COLUMNS) y valores (VALUES) alineados
    printf "%-15s " "time"
    for label in $COLUMNS; do
        printf "%-15s " "$label"
    done
    echo

    printf "%-15s " "$TIME"
    for value in $VALUES; do
        printf "%-15s " "$value"
    done
    echo

    # Esperar el intervalo antes de actualizar
    sleep "$INTERVAL"
done