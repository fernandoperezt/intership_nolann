#!/bin/bash

sudo dnf install --assumeyes git-all

sudo dnf install --assumeyes httpd

sudo systemctl start httpd

sudo systemctl enable httpd

sudo dnf install --assumeyes mariadb

sudo dnf install --assumeyes mariadb-server

mariadb --version

sudo mariadb < db.sql
