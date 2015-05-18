. `dirname $0`/../get_latest_2.x_download_file.sh
if [ $? -ne 0 ]; then
    exit $?;
fi
. `dirname $0`/opencv_install.sh
