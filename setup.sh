#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")

echo "==== Python Virtual Environment Setup ===="

python_version=$(python3 -V 2>&1 | cut -d' ' -f2)
echo "Using Python version: $python_version"

if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 is not installed. Please install it first."
    exit 1
fi

if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed. Please install it first."
    exit 1
fi

read -p "Enter the name of the virtual environment (default: env): " env_name
env_name=${env_name:-env}

echo "Please enter the folder path for the project (use TAB to autocomplete):"
read -e -p "Folder Path: " project_folder

while [ -z "$project_folder" ]; do
    echo "You must enter a folder name."
    read -e -p "Folder Path: " project_folder
done

project_folder="${project_folder%/}"

if [ "$project_folder" == "$script_dir" ]; then
    echo "Folder path matches the script's directory. Using the base directory for the environment."
    project_folder="$script_dir"
fi

if [ ! -d "$project_folder" ]; then
    echo "Folder does not exist. Creating folder: $project_folder"
    mkdir -p "$project_folder"
fi

cd "$project_folder" || exit

if [ -d "$env_name" ]; then
    read -p "Virtual environment '$env_name' already exists. Do you want to recreate it? (y/n): " recreate
    if [[ "$recreate" =~ ^[Yy]$ ]]; then
        rm -rf "$env_name"
        echo "Removed existing environment."
    else
        echo "Using existing environment."
    fi
fi

if [ ! -d "$env_name" ]; then
    python3 -m venv "$env_name"
    echo "Virtual environment '$env_name' created in $project_folder."
fi

gitignore_path=".gitignore"

if [ -f "$gitignore_path" ]; then
    if ! grep -q "^$env_name/" "$gitignore_path"; then
        echo "$env_name/" >> "$gitignore_path"
        echo "Added '$env_name/' to the existing .gitignore file."
    else
        echo "'$env_name/' is already in the .gitignore file."
    fi
else
    echo "$env_name/" > "$gitignore_path"
    echo "Created new .gitignore file and added '$env_name/' to it."
fi

activate_path="./$env_name/bin/activate"
read -p "Do you want to activate the virtual environment now? (y/n): " activate_now

if [[ "$activate_now" =~ ^[Yy]$ ]]; then
    if [ -f "$activate_path" ]; then
        echo "Activating the virtual environment..."
        source "$activate_path"
        echo "Environment '$env_name' is now active!"
        echo "You can deactivate it anytime by typing 'deactivate'"
        
        read -p "Would you like to install common packages (pip, setuptools, wheel)? (y/n): " install_common
        if [[ "$install_common" =~ ^[Yy]$ ]]; then
            pip install --upgrade pip setuptools wheel
        fi
        
        read -p "Would you like to install requirements from a requirements.txt file? (y/n): " install_req
        if [[ "$install_req" =~ ^[Yy]$ ]]; then
            if [ -f "requirements.txt" ]; then
                pip install -r requirements.txt
            else
                echo "No requirements.txt found. Creating an empty one..."
                touch requirements.txt
                echo "Created requirements.txt. Add your dependencies there."
            fi
        fi
        
        echo -e "\nUseful commands:"
        echo "- To install packages: pip install <package_name>"
        echo "- To save requirements: pip freeze > requirements.txt"
        echo "- To deactivate: deactivate"
        echo "- To reactivate later: source $activate_path"
    else
        echo "Error: Activation script not found at $(realpath "$activate_path")."
        exit 1
    fi
else
    echo "To activate the environment later, run: source $(realpath "$activate_path")"
fi

