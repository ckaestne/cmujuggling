jekyll build
cd _site
scp -r . ckaestne@linux.andrew.cmu.edu:jugglewww/
wget "https://www.andrew.cmu.edu/cgi-bin/publish?FLAG=0&NAME=juggle" -O -
