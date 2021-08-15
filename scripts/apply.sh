#!/bin/bash
echo '*** start ***'
for dataset_name in $(ls -d -A ./tables/*/ | sed 's/\.\/tables\///g' | sed 's/\///g'); do
    for schema in $(ls ./tables/${dataset_name}/*.json); do
        table_name=$(basename　${schema} | sed 's/\.[^\.]*$//')
        query=$(cat ./queries/${dataset_name}/${table_name}.sql)
        echo '*****'
        echo 'dataset_name: ${dataset_name}'
        echo 'table_name: ${table_name}'
        echo 'schema: ${schema}'
        echo 'query: ${query}'
        bq query '${query}' && bq update --schema=${schema} ${dataset_name}.${table_name}
    done
done
echo '*** finish ***'
