#!/bin/bash

ERROR=`tput setaf 1`
SUCCESS=`tput setaf 2`
WARNING=`tput setaf 3`
INFO=`tput setaf 6`
RESET=`tput sgr0`

VIRTUALENV_NAME=de-training

VIRTUALENVWRAPPER_INSTALLED=`command -v virtualenv`
if [ -z "$VIRTUALENVWRAPPER_INSTALLED" ]; then
    echo "${ERROR}ERROR: You must have ${INFO}virtualenv${ERROR} to set up this project.${RESET}"
    echo "Please install using ${INFO} pip install virtualenv ${RESET} "
    exit
fi

echo "${INFO}Creating virtual environment... ${RESET}"
virtualenv $VIRTUALENV_NAME 
echo "${VIRTUALENV_NAME}/bin/activate"
source "${VIRTUALENV_NAME}/bin/activate"
echo "${SUCCESS}Virtual environment created! ${RESET}"

echo "${INFO}Installing dependencies... ${RESET}"
pip install -r Docker/requirements/requirements.txt
echo "${SUCCESS}Dependencies installed! ${RESET}"

source "${VIRTUALENV_NAME}/bin/activate"

echo -n "${SUCCESS}You're all set -> ${RESET}"


#source "de-training/bin/activate"