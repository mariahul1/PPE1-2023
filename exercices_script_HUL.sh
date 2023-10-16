#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 year entity_type data_file"
    exit 1
fi

year="$1"
entity_type="$2"
data_file="$3"

count=0
while IFS=, read -r file_year file_entity_type rest; do
    if [ "$file_year" = "$year" ] && [ "$file_entity_type" = "$entity_type" ]; then
        
        count=$((count+1))
    fi
done < "$data_file"
echo "Number of $entity_type entities for the year $year: $count"


################



#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 entity_type data_file"
    exit 1
fi

entity_type="$1"
data_file="$2"

years=("2021" "2022" "2023")

for year in "${years[@]}"; do
    ./counter_entites.sh "$year" "$entity_type" "$data_file"
done\




######################## ex 2 

#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 year month number_of_places"
    exit 1
fi

year="$1"
month="$2"
number_of_places="$3"

data_file='your_data_file.csv'

if [ "$year" != '*' ] && [ "$month" != '*' ]; then
    filtered_data=$(awk -F, -v year="$year" -v month="$month" '$2 == year && $3 == month' "$data_file")
else
    filtered_data=$(cat "$data_file")
fi

places_ranking=$(echo "$filtered_data" | cut -d ',' -f 4 | sort | uniq -c | sort -nr | head -n "$number_of_places")

echo "Top $number_of_places Places in $month $year:"
echo "$places_ranking"
