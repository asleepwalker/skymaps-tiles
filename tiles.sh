for i in $(find . -name "map.jpg"); do
	echo $(dirname $i);
	rm -rf $(dirname $i)/tiles;
	mkdir $(dirname $i)/tiles;
	convert $i -crop 256x256 -set filename:tile "%[fx:page.x/256]-%[fx:page.y/256]" -background none -extent 256x256 "$(dirname $i)/tiles/%[filename:tile].png";
done