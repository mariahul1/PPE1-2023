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
done