#!/bin/bash

# Color Codes for Readability
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Create Conda Environment for Odoo 17
echo -e "${GREEN}Creating Conda environment for Odoo 18...${NC}"
conda create -n odoo18-env python=3.11 -c conda-forge -y

# Activate the Conda Environment
echo -e "${GREEN}Activating Conda environment...${NC}"
conda activate odoo18-env

# Create Odoo Directory Structure
echo -e "${GREEN}Creating Odoo directory structure...${NC}"

sudo mkdir -p /opt/odoo18_community/odoo
sudo mkdir -p /opt/odoo18_community/custom_addons
sudo chmod 777 -R /opt/odoo18_community
# Clone Odoo 17 Source
echo -e "${GREEN}Cloning Odoo 17 source from GitHub...${NC}"
sudo git clone https://github.com/odoo/odoo.git --depth 1 --branch 18.0 /opt/odoo18_community/odoo

# Install Dependencies within the Conda Environment
echo -e "${GREEN}Installing dependencies...${NC}"

pip install -r /opt/odoo18_community/odoo/requirements.txt
# Create Odoo Configuration File
echo -e "${GREEN}Creating Odoo configuration file...${NC}"
sudo tee /opt/odoo18_community/odoo18.conf << EOF
[options]
addons_path = /opt/odoo18_community/odoo/addons,/opt/odoo18_community/custom_addons
data_dir = /home/$USER/.local/share/Odoo
admin_passwd = 1122
db_host = False
db_port = False
db_name = False
db_user = odoo17
db_password = 1122
web.max_file_upload_size = 200000000
http_port = 8069
limit_request = 10000
limit_time_cpu = 1800
limit_time_real = 12000
limit_memory_soft = 2147483648
limit_memory_hard = 2684354560
max_cron_threads = 1
EOF
