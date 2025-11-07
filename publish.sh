
## generate pages

#npm install marked@13.0.2
bash ./build.sh
cd festival
#npm install marked@13.0.2
bash ./build.sh
rm body.html
cd ..
rm gallery.html
rm body.html

# prepare site
rm -rf _site || true
mkdir _site
cp -r festival _site/
cp -r css _site/
cp -r js _site/
cp -r img _site/
cp -r photos _site/
cp -r *.html _site/
rm index.html
rm festival/index.html

echo "Ensure you are in the campus network (VPN if needed) and use the andrew account"

scp -r _site/* ckaestne@linux.andrew.cmu.edu:jugglewww/

curl "https://www.andrew.cmu.edu/cgi-bin/publish?FLAG=0&NAME=juggle" 
