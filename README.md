# bigquery-view-description-as-code

## Requirments

- BigQuery
  - the dataset for the view
- GCP Service Account
  - permission: role/BigQuery.dataEditor
  - export: json key file
- GitHub Actions
  - secrets.GCP_PROJECT_ID
  - secrets.GCP_SA_KEY

## Usage

<1> checkout new git-branch

<2> add the following files to manage description about {test_dataset}.{test_table}

<2-1> ./queries/{test_dataset}/{test_table}.sql

```sql
SELECT 
    1 AS one,
    2 AS two,
    "3" AS three,
```

<2-2> ./tables/{test_dataset}/{test_table}.json

```json
[
  {
    "name": "one",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "this is one as integer"
  },
  {
    "mode": "NULLABLE",
    "name": "two",
    "type": "INTEGER",
    "description": "this is two as integer"
  },
  {
    "mode": "NULLABLE",
    "name": "three",
    "type": "STRING",
    "description": "this is three as string"
  }
]
```

*you can copy schema.json for the table that already exists by the following command at GCP-console-shell

```sh
$ bq show --project_id={project_id} --schema --format=prettyjson {dataset_name}.{table_name}
```
More details about schema definitions are available in [official docments](https://cloud.google.com/bigquery/docs/schemas).
<3> create Pull Request 

<4> merge to main branch

<5> BQ view will be updated after merge
