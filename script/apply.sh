for schema in $(ls ../tables/*.json); do
    table_name=$(basename　${schema} | sed 's/\.[^\.]*$//')
    query=$(cat ../queries/${table_name}.sql)
    echo '*****'
    echo 'table_name: ${table_name}'
    echo 'schema: ${schema}'
    echo 'query: ${query}'
    bq query '${query}' && bq update --schema=${schema} ${table_name}
done
