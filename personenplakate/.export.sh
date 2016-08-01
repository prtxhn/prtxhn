 #!/bin/bash

FOLDER=./exprt
JPG=./jpg
CMYK=./cmyk

mkdir -p $FOLDER



echo "Exporting from inkscape svg to pdf + png...\n"

for i in *.svg ; do 
	echo processing $i
   # inkscape --export-pdf="$FOLDER/${i%.*}.pdf" --export-area-page --export-dpi=150 --export-text-to-path "$i"
    inkscape --export-png="$FOLDER/${i%.*}.png" --export-area-page --export-dpi=42 -f "$i"
done

pushd $FOLDER
echo "converting to jpg...\n"
mkdir -p $JPG

for i in *.png ; do 
	echo processing $i
    convert -quality 90 "$i" "$JPG/${i%.*}.jpg"
done


#echo "Converting to CMYK...\n"
#mkdir -p $CMYK

#for i in *.pdf ; do 
#	echo processing $i
#    gs -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -r150 -sDEVICE=pdfwrite -sColorConversionStrategy=CMYK -dProcessColorModel=/DeviceCMYK -sOutputFile="$CMYK/${i%.*}.pdf" "$i" ;
#done

popd


#tar -cZf /var/my-backup.tgz /home/me/
