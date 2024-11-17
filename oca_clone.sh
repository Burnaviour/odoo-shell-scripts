#!/bin/bash

# Color Codes for Readability
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Clone top 10 OCA repositories with the highest star rating (excluding non-17.0 branches)
echo -e "${GREEN}Cloning top 10 OCA repositories with the highest star rating (excluding non-17.0 branches)...${NC}"

# List of top OCA repositories (update to include new ones if needed)

REPOSITORIES=(
  "https://github.com/OCA/server-ux.git"
  # "https://github.com/OCA/web.git"
  # "https://github.com/OCA/pos.git"
  # "https://github.com/OCA/server-tools.git"
  # "https://github.com/OCA/edi.git"
  # "https://github.com/OCA/contract.git"
  # "https://github.com/OCA/hr.git"
  # "https://github.com/OCA/knowledge.git"
  # "https://github.com/OCA/project.git"
  # "https://github.com/OCA/purchase-workflow.git"
  # "https://github.com/OCA/account-analytic.git"
  # "https://github.com/OCA/website.git"
  # "https://github.com/OCA/stock-logistics.git"
  # "https://github.com/OCA/stock-picking.git"
  # "https://github.com/OCA/OpenUpgrade.git"
  # "https://github.com/OCA/connector.git"
  # "https://github.com/OCA/reporting-engine.git"
  # "https://github.com/OCA/OCB.git"
  # "https://github.com/OCA/stock-logistics-warehouse.git"
  # "https://github.com/OCA/account-financial-tools.git"
  # "https://github.com/OCA/rest-framework.git"
  # "https://github.com/OCA/sale-workflow.git"
  # "https://github.com/OCA/l10n-spain.git"
  # "https://github.com/OCA/vertical-medical.git"
  # "https://github.com/OCA/l10n-brazil.git"
  # "https://github.com/OCA/account-invoicing.git"
  # "https://github.com/OCA/odoorpc.git"
  # "https://github.com/OCA/account-financial-reporting.git"
  # "https://github.com/OCA/stock-logistics-workflow.git"
  # "https://github.com/OCA/bank-payment.git"
  # "https://github.com/OCA/management-system.git"
  # "https://github.com/OCA/geospatial.git"
  # "https://github.com/OCA/product-attribute.git"
  # "https://github.com/OCA/queue.git"
  # "https://github.com/OCA/manufacture.git"
  # "https://github.com/OCA/l10n-switzerland.git"
  # "https://github.com/OCA/commission.git"
  # "https://github.com/OCA/event.git"
  # "https://github.com/OCA/website-cms.git"
  # "https://github.com/OCA/iot.git"
  # "https://github.com/OCA/vertical-association.git"
  # "https://github.com/OCA/webhook.git"
  # "https://github.com/OCA/partner-contact.git"
)

# Create the parent directory if it doesn't exist
PARENT_DIR="OCA_Repos"
if [! -d "$PARENT_DIR" ]; then
  mkdir "$PARENT_DIR"
fi

# Clone the top 10 repositories with 17.0 branch inside OCA_ prefixed folders
for REPO in "${REPOSITORIES[@]}"; do
  # Extract the repository name from the URL (keep only the last part after the last '/')
  REPO_NAME=$(basename "$REPO")
  
  # Remove '.git' from the repository name if present
  REPO_NAME=${REPO_NAME%.git}
  
  # Construct the full folder path with the OCA_ prefix
  FOLDER_NAME="OCA_${REPO_NAME}"
  FULL_FOLDER_PATH="$PARENT_DIR/$FOLDER_NAME"
  
  echo -e "${GREEN}Cloning ${REPO} with 17.0 branch into ${FULL_FOLDER_PATH}...${NC}"
  
  if [! -d "$FULL_FOLDER_PATH" ]; then
    mkdir "$FULL_FOLDER_PATH"
  fi
  
  git clone --depth 1 --branch 17.0 "$REPO" "$FULL_FOLDER_PATH"
  echo -e "${GREEN}Done cloning ${REPO} into ${FULL_FOLDER_PATH}...${NC}"
done