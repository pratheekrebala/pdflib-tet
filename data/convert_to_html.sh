tet --verbose 4 --tetml page --docopt "$(cat ./docoptions)" --pageopt "$(cat ./pageoptions)" $1
#xsltproc -o $1.html tetml2html.xsl `basename $1 .pdf`.tetml