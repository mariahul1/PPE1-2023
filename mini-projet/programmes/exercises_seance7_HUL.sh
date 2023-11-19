#!/usr/bin/env bash

if [[ $# -ne 2 ]];
then
    echo "On veut exactement deux arguments au script."
    exit 1
fi

URLS=$1
OUTPUT_FILE=$2

if [ ! -f $URLS ]
then
    echo "On attend un fichier, pas un dossier."
    exit 1
fi

echo "<html>
	<head>
		<meta charset=\"UTF-8\">
        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css\">
	</head>
	<body>" > "$OUTPUT_FILE"

echo "<section class=\"section\">
        <div class=\"container\">" >> "$OUTPUT_FILE"

echo "<table class=\"table is-fullwidth\">
		<thead>
            <tr><th>ligne</th><th>URL</th><th>code HTTP</th><th>encodage</th></tr>
        </thead>
        <tbody>" >> "$OUTPUT_FILE"

lineno=1
while read -r URL
do
    response=$(curl -s -I -L -w "%{http_code}" -o /dev/null $URL)
    encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)
    echo "<tr>
		<td>$lineno</td>
		<td>$URL</td>
		<td>$response</td>
		<td>$encoding</td>
    	</tr>" >> "$OUTPUT_FILE"
     lineno=$(expr $lineno + 1)
done < "$URLS"

echo "	</tbody>
    </table>" >> "$OUTPUT_FILE"

echo "    </div>
    </section>
	</body>
</html>" >> "$OUTPUT_FILE"








