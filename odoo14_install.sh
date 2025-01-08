#!/bin/bash

# Color Codes for Readability
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Create Conda Environment for Odoo 14
echo -e "${GREEN}Creating Conda environment for Odoo 14...${NC}"
conda create -n odoo14-env python=3.7 -c conda-forge -y

# Initialize Conda for the current shell
echo -e "${GREEN}Initializing Conda for the current shell...${NC}"
conda init

# Activate the Conda Environment
echo -e "${GREEN}Activating Conda environment...${NC}"
source ~/.bashrc
conda activate odoo14-env

# Install Dependencies within the Conda Environment
echo -e "${GREEN}Installing dependencies...${NC}"

# pip install -r https://github.com/odoo/odoo/raw/14.0/requirements.txt

# Create Odoo Directory Structure
echo -e "${GREEN}Creating Odoo directory structure...${NC}"
sudo mkdir -p /opt/odoo14_community/odoo
sudo mkdir -p /opt/odoo14_community/custom_addons

# Clone Odoo 14 Source
echo -e "${GREEN}Cloning Odoo 14 source from GitHub...${NC}"
sudo git clone https://github.com/odoo/odoo.git --depth 1 --branch 14.0 /opt/odoo14_community/odoo

# Create Odoo Configuration File
echo -e "${GREEN}Creating Odoo configuration file...${NC}"
sudo chmod 777 -R /opt/odoo14_community/
sudo tee /opt/odoo14_community/odoo.conf << EOF
[options]
addons_path = /opt/odoo14_community/odoo/addons,/opt/odoo14_community/custom_addons
data_dir = /home/$USER/.local/share/Odoo
admin_passwd = 1122
db_host = False
db_port = False
db_name = False
db_user = odoo17
db_password = 1122
web.max_file_upload_size = 200000000
http_port = 8079
limit_request = 10000
limit_time_cpu = 1800
limit_time_real = 12000
limit_memory_soft = 2147483648
limit_memory_hard = 2684354560
max_cron_threads = 1
EOF
