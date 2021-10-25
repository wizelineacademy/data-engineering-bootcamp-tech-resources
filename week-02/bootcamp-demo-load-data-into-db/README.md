# Bootcamp-data-demo-week-02

This repository contains the source code of the Wizeline Data Engineer Bootcamp session, the code is stored in the following folders:

1. Docker > scripts:
    -entreypoint.sh (commands utils to use in the instructions).
    -stup.sh(commands utils to use in the instructions).
2. Docker > custom_modules> 
    -bootcamp-data-airflow-load-data-into-db.py (custom operator built in the "S3ToPostgresTransfer" DEMO)
3. Docker > custom_modules> assets:
    -bootcampdb.products.sql: DDL CREATE TABLE PRODUCTS statement.
    -products.csv: Data source stored in S3.
4. Docker > dags:
    -load_products_dag.py
5. Docker:
    -Dockerfile: File to install Airflow in Docker.
    -docker-compose.yml: config file for Airflow.

# Instructions

Install docker and create required services in AWS:

1. Install docker on your local machine: https://hub.docker.com/
2. Install Visual Studio Code: https://code.visualstudio.com/
3. Create a free account for 12 months on Amazon (AWS) https://aws.amazon.com/es/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort -order = asc & awsf.Free% 20Tier% 20Types = tier% 2312monthsfree & awsf.Free% 20Tier% 20Categories = * all & refid = ps_a134p000003yhp3aai & trkcampaign = acq_paid_search_brand # Free_Tier_details
4. Create IAM user and associate Administrator group: https://docs.aws.amazon.com/es_es/systems-manager/latest/userguide/setup-create-admin-user.html

Setup the project in your local environment

1. Download or Clone the project from in your local file system: https://github.com/wizelineacademy/data-engineering-bootcamp-tech-resources.git (git clone)
2. Open the project downloaded from the git repository in Visual Code> Code, File> Open> DATA-ENGINEERING-BOTCAMP-TECH-RESOURCES > Week-02 > 
3. Open a new terminal in visual studio code.
4. Create a new virtual environment with the command: ./Docker/scripts/setup.sh in the Visual Studio Code terminal, if the file does'nt has permissions, set the permissions with the command: chmod +x ./Docker/scripts/setup.sh
4.1. Install the virtual environment in the terminal of Visual Code, with the next command: pip install virtualenv   
4.2. Make sure that the virtual environment is active with the command:  pip freeze | grep virtualenv   
4.3. In case that the virtual environment is not activate, activate your virtual environment with the command: de-training/bin/activate.

Create Airflow container in Docker.

1. Run the command "docker compose up -d --build" in the Visual Code terminal to upload the Airflow service
2. In the VS Code terminal, validate the status of the service above, with the docker ps command.
3. Open your web browser and type localhost: 8080, once you log in, log in with the user: airflow, pwd: airflow.
4. In the AWS> IAM> USERS console create an IAM user and associate a group with read permissions on your S3 bucket, download credentials {"aws_access_key_id": "xxxxxxx", "aws_secret_access_key": "xxxxxx"}
5. In the AWS console> RDS> Databases> your Postgres DB, select the endpoint, user, password, and port.
6. Configure the connections "default_aws", "default_postgres" in Airflow> Admin> Connections
7. Run the pipeline (DAG) "dag_insert_data".
8. Access the Tree view graph, select the executed task, select the logs option, and validate its execution.


