import airflow.utils.dates

# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG

# Operators; we need this to operate!
from custom_modules.dag_s3_to_postgres import S3ToPostgresTransfer

default_args = {
    'owner': 'juan.escobar',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(1)
}

dag = DAG('dag_insert_data', default_args = default_args, schedule_interval = '@daily')

process_dag = S3ToPostgresTransfer(
    task_id = 'dag_s3_to_postgres',
    schema = 'bootcampdb',
    table= 'products',
    s3_bucket = 'bootcamp-wl-de-airflow',
    s3_key =  'products.csv',
    aws_conn_postgres_id = 'postgres_default',
    aws_conn_id = 'aws_default',   
    dag = dag
)

process_dag