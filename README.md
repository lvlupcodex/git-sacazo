# git-sacazo
¡ git-sacazo te mete todo a saco ! -> Se trata de un alias en español para trabajar con Git en proyectos en Codespaces. Hace git add, commit con fecha actual, pull con rebase y push


# ¿Como copiar este .sh? ¡Fácil :)!

curl -s https://raw.githubusercontent.com/lvlupcodex/setup-sacazo-codespaces/main/setup-sacazo.sh | bash

# ¿Dónde funciona esto?
Este script es compatible con todos los Codespaces o contenedores de desarrollo que tengan estas características:

- Usan Linux, especialmente RockyLinux o cualquier derivado **RedHat.**

- Tienen Git ya instalado (Codespaces, por ejemplo).

- Se ejecutan en terminales Bash o similares (sh, zsh).

- El contenedor tiene acceso a nano o vim para los commits (o se setea otro editor).

---
---

## COMANDO QUE APARECE EN EL .SH

#!/bin/bash


### CONFIGURACIÓN INICIAL DE GIT PARA CODESPACES BASADOS EN ROCKYLINUX + SPRING BOOT En mi perfil aparece un .devcontainer de estas características, se puede utilizar el template y desde ahí -> ejecutar este .sh

### Sustituye estos valores por los tuyos personales
git config --global user.name "PONER_AQUI_TU_USER_NAME"
git config --global user.email "PONER_AQUI_TU_EMAIL"
git config --global core.editor "nano"

### Alias en español para trabajar con Git en proyectos en Codespaces
### Hace git add, commit con fecha actual, pull con rebase y push
git config --global alias.sacazo '!f() {
  if [ "$1" == "--help" ]; then
    echo "Este comando agrega todos los cambios, hace commit con fecha actual y sube al repositorio.";
    echo "Uso: git sacazo o git-sacazo";
    return;
  fi;
  ts=$(date "+%Y-%m-%d %H:%M");
  git add .;
  git commit -m "$ts Auto commit success. :D";
  git pull origin $(git branch --show-current) --rebase;
  git push origin $(git branch --show-current);
}; f'

### Alias de terminal interactivo (no persiste fuera del container)
echo 'alias git-sacazo="git sacazo"' >> ~/.bashrc

### Mostrar configuración aplicada
echo "Configuración completada"
git config --global --list
