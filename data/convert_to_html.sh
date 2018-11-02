tet --verbose 2 --tetml page --docopt "$(cat ./docoptions)" --pageopt "$(cat ./pageoptions)" --targetdir $1
tet --verbose 2 --text --docopt "$(cat ./docoptions)" --pageopt "$(cat ./pageoptions)" --targetdir $1
#xsltproc -o $1.html tetml2html.xsl `basename $1 .pdf`.tetml