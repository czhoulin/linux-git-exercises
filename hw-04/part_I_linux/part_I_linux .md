# hw-04-linux

## Ejercicio 1

Obtenemos el fichero con ejemplos de logs de acceso a NGINX:
~~~~
curl -o nginx_logs_examples.log https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_logs/nginx_logs
~~~~
- Vemos el fichero en nuestro directorio

    ![image](./images/1.png)

- Podemos ver el contenido ejecutando _cat nginx\_logs\_examples.log_

    ![image](./images/2.png)

Extraemos los datos especificados en el enunciado del ejercicio mediante:
~~~~
cut nginx_logs_examples.log -d ' ' -f 1 | sort -nr | uniq -c  | awk '{print $2" -> "$1}' > nginx_requests_total.txt
~~~~
1. Cortamos [cut] la parte que nos interesa de cada línea del archivo [nginx\_logs\_examples.log], la columna de IPs, que es la primera [-f 1]. Especificamos que el espacio en blanco es el delimitador [-d ' '].
2. Ordenamos [sort] los datos seleccionados por orden numérico [-n] descendiente [-r].
3. Evitamos mostrar los valores repetidos de IP [uniq] y los contamos [-c], agregando el número de ocurrencias de cada IP como prefijo de cada línea 
4. Ahora tenemos solo dos columnas: la primera, el número de ocurrencias; la segunda, la dirección IP. Formateamos la salida según como se espera en el ejercicio [awk '{print $2" -> "$1}]. Con awk podemos referencias toda la línea; cada columna se acaba guardando por orden en variables (por defecto detecta los espacios en blanco para hacer las separaciones). La variable $0 es toda la línea.

    ![image](./images/3.png)

## Ejercicio 2

Script
~~~
DIRECTORY="/backup/<student_name>/<year>/<month>/<day>"
DIA=`date +%d`
MES=`date +%m`
YEAR=date +%Y
MONTH=date +%m`
DAY=`date +%d`
DAYNAME=date +%A
FILE=nginx_log_requests_$YEAR$MONTH$DAY.log

[ ! -d "$DIRECTORY" ] && mkdir -p /backup/carolina/"$YEAR"/$MONTH"/"$DAY"

[ -d "$DIRECTORY" ] && cp nginx_requests_total.txt /backup/carolina/"$YEAR"/$MONTH"/"$DAY"/"$FILE"

//TODO While to get files from the whole week and zip them

~~~

## Ejercicio 3

Si este script lo nombramos "exercise.sh" y está ubicado en /root con los permisos correspondientes para la ejecución:

59 23 * * 1-0 root /root/exercise.sh