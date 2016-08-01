mkdir -p ./cmyk/

for i in *.pdf ; do 
    gs -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite -sColorConversionStrategy=CMYK -dProcessColorModel=/DeviceCMYK -sOutputFile="./cmyk/${i%.*}.pdf" "$i" ;
done

