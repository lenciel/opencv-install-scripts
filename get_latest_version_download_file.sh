# Find the latest version and download file link from the OpenCV sourceforge page

version="$(wget -q -O - https://api.github.com/repos/Itseez/opencv/tags | egrep -m1 -o '\"[0-9](\.[0-9]+)+(-[-a-zA-Z0-9]+)?' | cut -c2-)"
downloadfilelist="opencv-$version.tar.gz opencv-$version.zip"
downloadfile=
for file in $downloadfilelist;
do
        wget --spider https://github.com/Itseez/opencv/archive/$version.zip
        if [ $? -eq 0 ]; then
                downloadfile=$file
        fi
done
if [ -z "$downloadfile" ]; then
        echo "Could not find download file on sourceforge page.  Please find the download file for version $version at"
        echo "https://github.com/Itseez/opencv/releases and update this script"
        exit  1
fi
