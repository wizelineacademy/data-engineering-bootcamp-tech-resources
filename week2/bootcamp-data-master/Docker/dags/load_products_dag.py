from airflow import DAG
import airflow.utils.dates
from custom_modules.dag_s3_to_postgres import S3ToPostgresTransfer


default_args = {
    'owner': 'juan.escobar',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(1)
    #, #datetime(2021, 9, 29),
    #'email': ['juan.escobar@wizeline.com']#,
    #'email_on_failure': True,
    #'email_on_retry': True,
    #'retries': 1,
    #'retry_delay': timedelta(minutes=5),
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