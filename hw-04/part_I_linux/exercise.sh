YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
WEEKDAY=`date +%u`
FILENAME=nginx_log_requests_$YEAR$MONTH$DAY
DIRECTORY=/backup/carolina/$YEAR/$MONTH/$DAY

[ ! -d "$DIRECTORY" ] && sudo mkdir -p "$DIRECTORY"

[ -d "$DIRECTORY" ] && sudo cp /home/czhou/MPWAR/repos/linux-git-exercises/hw-04/part_I_linux/nginx_requests_total.txt "$DIRECTORY"/"$FILENAME".log

[ "$WEEKDAY" -eq 7 ] find /backup/carolina -type f -iname "*.log" -mtime -7 -print0 | sudo tar --transform 's/.*\///g' -czvf "$FILENAME".tar.gz -T - | sudo mv "$FILENAME".tar.gz "$DIRECTORY"