#!/bin/bash

npx marked -o body.html index.md

current_date=$(date +"%B %d, %Y")
echo $current_date


gallerystart="<div class=\"wow bounceInUp\" data-wow-delay=\"0.4s\"><div id=\"owl-works\" class=\"owl-carousel\">"
galleryend="</div></div>"

galleries=""
for photo in photos/*.jpg; do
    filename=$(basename "$photo")
    thumb="photos/thumbs/${filename%.*}-thumb.${filename##*.}"
    galleries+="<div class=\"item\"><a href=\"$photo\" data-lightbox-gallery=\"gallery1\"><img src=\"$thumb\" class=\"img-responsive\" alt=\"img\"></a></div>"
done

echo -e "$gallerystart\n$galleries\n$galleryend\n\n" > gallery.html

sed '/\$BODY\$/{
    r body.html
    d
}' template.html | sed "s/\\\$DATE\\\$/$current_date/" | sed '/\$GALLERY\$/{
     r gallery.html 
     d
}' > index.html

