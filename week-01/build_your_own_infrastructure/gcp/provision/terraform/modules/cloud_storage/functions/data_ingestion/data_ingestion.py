import zipfile
import requests
from os import getenv
from os import listdir
from os.path import isfile, join
from datetime import datetime
from google.cloud import storage

CONTENT_URL = getenv('CONTENT_URL')
BUCKET_NAME = getenv('BUCKET_NAME')

def upload_blob(bucket_name, source_file_name, destination_blob_name):
    """Uploads a file to the bucket."""
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)
    print(f"Uploading file {source_file_name} to {destination_blob_name}")
    blob.upload_from_filename(source_file_name)

def download_unzip_upload(request):
    filename = "/tmp/" + str(datetime.utcnow().date()).replace('-','') + ".zip"
    req = requests.get(CONTENT_URL, allow_redirects=True)
    open(filename, 'wb').write(req.content)
    with zipfile.ZipFile(filename, 'r') as zip_ref:
        zip_ref.extractall('/tmp')
    path = "/tmp"
    onlycsv = [f for f in listdir(path) if isfile(join(path, f)) and f.split(".")[-1] == "csv"]
    csv_filepath = "/tmp/" + onlycsv[0]
    upload_blob(BUCKET_NAME, csv_filepath, onlycsv[0])
    return "OK"