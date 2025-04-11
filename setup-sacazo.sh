#!/bin/bash

# CONFIGURACIÓN INICIAL DE GIT PARA CODESPACES BASADOS EN ROCKYLINUX + SPRING BOOT

# Sustituye estos valores por los tuyos personales
git config --global user.name "PONER_AQUI_TU_USER_NAME"
git config --global user.email "PONER_AQUI_TU_EMAIL"
git config --global core.editor "nano"

# Alias en español para trabajar con Git en proyectos en Codespaces
# git sacazo Hace git add, commit con fecha actual, pull con rebase y push
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

# Alias de terminal interactivo (no persiste fuera del container) :,c
echo 'alias git-sacazo="git sacazo"' >> ~/.bashrc

# Mostrar configuración aplicada :D
echo "Configuración completada :D"
git config --global --list
