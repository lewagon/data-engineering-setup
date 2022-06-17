### Configure Cloud sdk

- Open the service account json file with any text editor and copy the key
```
# It looks like:
{
    "type": "service_account",
    "project_id": "kevin-bootcamp",
    "private_key_id": "1234567890",
    "private_key": "-----BEGIN PRIVATE KEY-----\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n-----END PRIVATE KEY-----\n",
    "client_email": "bootcamp@kevin-bootcamp.iam.gserviceaccount.com",
    "client_id": "1234567890",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/bootcamp%40kevin-bootcamp.iam.gserviceaccount.com"
}
```
- Create a `/.gcp_keys` directory on your Virtual Machine, then create a json file in it:
``` bash
mkdir ~/.gcp_keys
touch ~/.gcp_keys/le-wagon-de-bootcamp.json
```
- Open the json file then store the service account json file pasting the key:
```bash
code ~/.gcp_keys/le-wagon-de-bootcamp.json
```
![service account json key](images/service_account_json_key.png)

❗️Don't forget to **save** the file with `CMD` + `s` or `CTRL` + `s`

- Authenticate the `gcloud` CLI with the google account you used for GCP
```bash
# Replace service_account_name@project_id.iam.gserviceaccount.com with your own
SERVICE_ACCOUNT_EMAIL=service_account_name@project_id.iam.gserviceaccount.com
KEY_FILE=$HOME/.gcp_keys/le-wagon-de-bootcamp.json
gcloud auth activate-service-account $SERVICE_ACCOUNT_EMAIL --key-file=$KEY_FILE
```
- List your active account and check your email address you used for GCP is present
```bash
gcloud auth list
```
- Set your current project
```bash
# Replace `PROJECT_ID` with the `ID` of your project, e.g. `wagon-bootcamp-123456`
gcloud config set project PROJECT_ID
```
- List your active account and current project and check your project is present
```bash
gcloud config list
```
