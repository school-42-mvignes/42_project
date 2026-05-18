#!/bin/bash

terminator -e "bash -c '
echo Nouveau terminal lancé
pwd
ls
exec bash
'"
