from random import randrange
from os import getenv
import requests
from google.cloud import storage

BUCKET_NAME = getenv('BUCKET_NAME')

def upload_blob(bucket_name, source_file_name, destination_blob_name):
    """Uploads a file to the bucket."""
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    blob.upload_from_filename(source_file_name)

    print(
        "File {} uploaded to {}.".format(
            source_file_name, destination_blob_name
        )
    )

def download_and_upload(request):
    response = requests.get('https://pokeapi.co/api/v2/1', allow_redirects=True)
    pokemon_id = str(randrange(151))
    filename = f"pokemon_{pokemon_id}.json"
    open(filename, 'wb').write(response.content)
    upload_blob(BUCKET_NAME, filename, filename)
    return "OK"