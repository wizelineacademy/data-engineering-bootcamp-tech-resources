# bootcamp-data
This repository contains the source code of the Wizeline Data Engineer Bootcamp session, the code is stored in the following folders:

1. airflow_env_clean: Contains the libraries used, the files with the ".py" extension housed in the project folders.

2. Docker> custom_modules> docker-compose.yml:

3. Docker> custom_modules> bootcamp-data-airflow-load-data-into-db.py: custom operator built in the "S3ToPostgresTransfer" DEMO.

4. Docker> custom_modules> assets:
-bootcampdb.products.sql: DDL CREATE TABLE PRODUCTS statement.
-products.csv: Data source stored in S3.

# Instructions

1. Install docker on your desktop: https://hub.docker.com/

2. Install Visual Studio Code: https://code.visualstudio.com/

3. Create a free account for 12 months on Amazon (AWS) https://aws.amazon.com/es/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort -order = asc & awsf.Free% 20Tier% 20Types = tier% 2312monthsfree & awsf.Free% 20Tier% 20Categories = * all & refid = ps_a134p000003yhp3aai & trkcampaign = acq_paid_search_brand # Free_Tier_details

4. Create IAM user and associate Administrator group: https://docs.aws.amazon.com/es_es/systems-manager/latest/userguide/setup-create-admin-user.html

5. Open the project downloaded from the git repository in Visual Studio> Code, File> Open> bootcamp-data-demo-airflow

6. Open a new terminal in visual studio.

7. Run the command "docker compose up -d --build" in the terminal to upload the Airflow service

8. In the VS Code terminal, validate the status of the service above, with the docker ps command.

9. Open your web browser and type localhost: 8080, once you log in, log in with the user: airflow, pwd: airflow.

10. In the AWS> IAM> USERS console create an IAM user and associate a group with read permissions on your S3 bucket, download credentials {"aws_access_key_id": "xxxxxxx", "aws_secret_access_key": "xxxxxx"}

11. In the AWS console> RDS> Databases> your Postgres DB, select the endpoint, user, password and port.

12. Configure the connections "default_aws", "default_postgres" in Airflow> Admin> Connections

13. Run the pipeline (DAG) "dag_insert_data".

14. Access the Tree view graph, select the executed task, select the logs option and validate its execution.
