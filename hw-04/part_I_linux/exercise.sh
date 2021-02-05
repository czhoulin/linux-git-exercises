YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
WEEKDAY=`date +%u`
FILENAME=nginx_log_requests_$YEAR$MONTH$DAY
DIRECTORY=/backup/carolina/$YEAR/$MONTH/$DAY

[ ! -d "$DIRECTORY" ] && mkdir -p "$DIRECTORY"

[ -d "$DIRECTORY" ] && cp /MPWAR/repos/linux-git-exercises/hw-04/part_I_linux/nginx_requests_total.txt "$DIRECTORY"/"$FILENAME".log
