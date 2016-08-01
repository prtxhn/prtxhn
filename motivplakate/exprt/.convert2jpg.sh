for i in *.png ; do convert "$i" "./jpg/${i%.*}.jpg" ; done

