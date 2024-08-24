# PowerShell deployment uputstvo

## Preduslovi

- **Admin**: IIS zahteva da deploy skriptu pokrećete kao admin.
- **IIS instalacija**: Proverite da li imate IIS instaliran na vašem sistemu.
- **WebAdministration modul**: Instalirajte WebAdministration modul preko PowerShell skripte globalno, ako već niste. Modul vam omogućava izvršenje `Stop-WebAppPool` i `Start-WebAppPool` naredbi.

## Deployment koraci

### 1. Pokrenite `publish.ps1`
Pokrenite Powershell skriptu da biste "publish-ovali" aplikaciju:
```
.\publish.ps1 -projectPath "E:\ProjectsForGithub\AnjaTest\AnjaTest1\AnjaTest1.sln" -projectOutputPath "E:\ProjectsForGithub\deployment-scripts\powershell\publish-data"
```

### 2. Ručno kopirajte zip fajl na server
Ručno kopirajte zip fajl generisan u prethodnom koraku na server.

### 3. Pokrenite `deploy.ps1` na serveru
Pokrenite "deployment" Powershell skriptu na serveru kako biste "deployovali" aplikaciju:
```
.\deploy.ps1 -appPoolName "TestApp" -deployPath "E:\ProjectsForGithub\deployment-scripts\powershell\local-deploy-data\deploy" -backupPath "E:\ProjectsForGithub\deployment-scripts\powershell\local-deploy-data\backup"
```