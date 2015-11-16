#!/bin/bash
# Heavily inspired, copied, stolen, etc. from http://blog.kaltepoth.de/posts/2010/09/06/github-maven-repositories.html

for DIR in $(find .m2 -type d); do
	(
		echo -e "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
		ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "^index\.html$" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
		echo -e "</pre>\n</body>\n</html>"
	) > $DIR/index.html
done
