jpegoptim -t -m50 --all-progressive *.jpg
sleep 3s
pngquant -f *.png
sleep 3s
optipng -o7 -strip all *.png
sleep 3s
gifsicle --batch -i *.gif
sleep 3s
_cwd="$PWD"
for file in $_cwd/*.svg
do
	python ~/scour/scour.py -i ${file} -o ${file}.n --enable-comment-stripping  --strip-xml-prolog
done
find . -type f -name '*.n' | while read f; do mv "$f" "${f%.n}"; done
