#!/bin/bash
# Heavily inspired, copied, stolen, etc. from http://blog.kaltepoth.de/posts/2010/09/06/github-maven-repositories.html

DIR_TO_INDEX=.m2
DEPTH=
HEADING='Directory Listing'

while true; do
	case "${1}" in
		-d | --dir ) DIR_TO_INDEX="$2"; shift 2 ;;
		-l | --depth ) DEPTH="$2"; shift 2 ;;
		* ) break ;;
	esac
done

for DIR in $(find ${DIR_TO_INDEX} $(test -n $DEPTH && echo -maxdepth $DEPTH) -type d); do
	echo Reindexing "${DIR}"...
	(
		echo -e "<html>\n<body>\n<h1>${HEADING}</h1>\n<hr/>\n<pre>"
		ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "^index\.html$" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
		echo -e "</pre>\n</body>\n</html>"
	) > $DIR/index.html
done
