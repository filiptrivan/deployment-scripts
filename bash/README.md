# Bash deployment uputstvo

## Preduslovi

- **Admin**: Zaustavljanje i pokretanje "servisa" obično zahteva "root" privilegije.
- **chmod +x**: Svaku Bash skriptu koju pokrećete, morate učiniti "executable".

## Deployment steps

### 1. Pokrenite `publish.sh`
Pokrenite Bash skriptu da biste "publish-ovali" aplikaciju:
```
sudo ./publish.sh <project_path> <project_output_path>
```

### 2. Ručno kopirajte zip fajl na server
Ručno kopirajte zip fajl generisan u prethodnom koraku na server.

### 3. Pokrenite `deploy.sh` na serveru
Pokrenite "deployment" Bash skriptu na serveru kako biste "deployovali" aplikaciju:
```
sudo ./deploy.sh <app_name> <deploy_path> <backup_path>
```