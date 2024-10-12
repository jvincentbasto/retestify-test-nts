#!/bin/bash

# Check required packages
if ! command -v gh &> /dev/null; then
    echo "Error: required packages not found - gh"
    exit 1
fi
if ! command -v jq &> /dev/null; then
    echo "Error: required package not found - jq"
    exit 1
fi

# Check parameters
if [ -z "$1" ]; then
    echo "\$1 - Organization: $1"
    echo "Usage: $0 <ORG_NAME> [versions|all] [REPO_NAME]"
    exit 1
fi
if [ -z "$2" ]; then
    echo "\$2 - Scope: $2"
    exit 1
fi

# Set variables
ORG_NAME="$1"
SCOPE="$2"
REPO_NAME="$3"

# Sample Default Parameters
# ORG_NAME="${1:-my-default-org}"
# ACTION="${2:-all}"

# Sample Optional Parameters
# REPO_NAME="$3"
# REPO_NAME="${3:-}"

# Sample Script - (package.json):
# "delete-packages": "./script-filename.sh <ORG_NAME> all <REPO_NAME>"
# "delete-packages": "./script-filename.sh ${1:-my-org} ${2:-all} ${3:-my-repo}"
# "delete-packages": "./script-filename.sh ${o:-my-org} ${v:-versions} ${r:-my-repo}"

# Sample Script Execution - (package.json):
# npm run delete-packages my-org all my-repo
# npm run delete-packages my-org versions my-repo
# npm run delete-packages --o=my-org --v=versions --r=my-repo



# Delete All Versions
delete_all_versions() {
    local scope=$1
    local scope_name=$2
    local package_path="/$scope/$scope_name/packages/container"

    echo "Scope: $scope_name -  Delete Start - Versions (all) in Packages (all)"

    for package in $(gh api -q '.[] | .name' "$package_path" | jq -r '.[]'); do
        for version in $(gh api -q '.[] | .id' "$package_path/$package/versions" | jq -r '.[]'); do
            echo "Deleting version ID: $version in $scope_name"
            gh api --method DELETE "$package_path/$package/versions/$version"
        done
    done

    echo "Scope: $scope_name -  Delete Finished - Versions (all) in Packages (all)"
}

# Delete All Packages
delete_all_packages() {
    local scope=$1
    local scope_name=$2
    local package_path="/$scope/$scope_name/packages/container"

    echo "Scope: $scope_name - Delete Start - Packages (all)"

    for package in $(gh api -q '.[] | .id' "$package_path" | jq -r '.[]'); do
        echo "Deleting package ID: $package in $scope_name"
        gh api --method DELETE "$package_path/$package"
    done

    echo "Scope: $scope_name - Delete Finished - Packages (all)"
}

# Delete By Organization
if [ "$SCOPE" == "versions" ]; then
    delete_all_versions "orgs" "$ORG_NAME"
elif [ "$SCOPE" == "all" ]; then
    delete_all_packages "orgs" "$ORG_NAME"

# Delete By Repository
elif [ "$SCOPE" == "versions" ] && [ -n "$REPO_NAME" ]; then
    delete_all_versions "repos" "$ORG_NAME/$REPO_NAME"
elif [ "$SCOPE" == "all" ] && [ -n "$REPO_NAME" ]; then
    delete_all_packages "repos" "$ORG_NAME/$REPO_NAME"

# Invalid Second Argument
else
    echo "Error: Invalid parameter. Use 'versions' or 'all'"
fi
