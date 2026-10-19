#!/bin/sh
#

#git init

#git remote add origin https://github.com/Markus-975/Host-iDocker1.git
git remote add origin git@github.com:Markus-975/Host-HomeMgt.git

## Git Ignore erstellen

cat > .gitignore << EOF
.env
*.log

data/
config/
database/
db/
redis/
postgres/

**/data/
**/config/
**/database/

backup/
backups/

*.sqlite
*.db
EOF

### SSH Key erstellen
#ssh-keygen -t ed25519 -C "HomeMgt"
### SSH Key anzeigen
#cat ~/.ssh/id_ed25519.pub
### Upload in Github account unter GitHub → Settings → SSH and GPG keys → New SSH key
#
#break
### Test SSH Verbindung mit
#ssh -T git@github.com

## Alle Files ergaenzen
git add */docker-compose.yml
git add .gitignore

## Alle Files Commiten
git commit -m "Initial docker compose import"

### Abgleich mit Github
git push -u origin main

