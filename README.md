# Python Virtual Env Setup

## Overview
The Python Virtual Environment Setup Script is a comprehensive bash utility designed to streamline the creation and management of Python virtual environments. It automates several common tasks including environment creation, gitignore configuration, dependency management, and provides an interactive interface for customizing the setup process.

## Prerequisites
Before using this script, ensure your system has:
- Bash shell
- Python 3.x installed
- pip3 installed
- Basic command line knowledge

## Installation
1. Save the script to your desired location
2. Make it executable:
   ```bash
   chmod +x path/to/script.sh
   ```

## Features

### Core Functionality
The script provides several key features:

1. **Python Environment Verification**
   - Checks for Python3 installation
   - Displays current Python version
   - Verifies pip3 availability

2. **Virtual Environment Management**
   - Creates new virtual environments
   - Detects existing environments
   - Offers option to recreate existing environments
   - Configures environment activation

3. **Git Integration**
   - Manages .gitignore file creation and updates
   - Automatically adds virtual environment directory to .gitignore
   - Preserves existing .gitignore entries

4. **Dependency Management**
   - Optional installation of common packages (pip, setuptools, wheel)
   - Handles requirements.txt creation and installation
   - Provides guidance for package management

## Usage Guide

### Basic Usage
Run the script from your terminal:
```bash
./setup_venv.sh
```

### Interactive Prompts

The script will guide you through several steps:

1. **Environment Name**
   - Enter your desired environment name or press Enter for default "env"
   - Example: myproject_env

2. **Project Location**
   - Specify the project directory path
   - Supports tab completion for easy navigation
   - Creates directory if it doesn't exist

3. **Environment Setup**
   - If an environment exists, choose to recreate or keep it
   - Automatically creates new environment if none exists

4. **Activation Options**
   - Choose whether to activate the environment immediately
   - Provides activation command for later use

5. **Package Installation**
   - Option to install common packages
   - Option to set up requirements.txt
   - Handles dependency installation

### Directory Structure
After running the script, your project structure will look similar to:
```
project_directory/
├── env/                  # or your custom environment name
├── .gitignore           # includes env/ entry
└── requirements.txt     # if created during setup
```

## Common Operations

### Activating the Environment
```bash
source env/bin/activate  # Replace 'env' with your environment name
```

### Deactivating the Environment
```bash
deactivate
```

### Managing Dependencies
- Install new packages:
  ```bash
  pip install package_name
  ```
- Save current dependencies:
  ```bash
  pip freeze > requirements.txt
  ```
- Install from requirements:
  ```bash
  pip install -r requirements.txt
  ```

## Troubleshooting

### Common Issues

1. **Permission Denied**
   - Solution: Ensure script has executable permissions
   ```bash
   chmod +x setup_venv.sh
   ```

2. **Python Not Found**
   - Solution: Install Python3 or check PATH settings
   ```bash
   sudo apt install python3  # For Ubuntu/Debian
   ```

3. **pip Not Found**
   - Solution: Install pip separately
   ```bash
   sudo apt install python3-pip  # For Ubuntu/Debian
   ```

4. **Environment Creation Fails**
   - Check Python installation
   - Verify write permissions in target directory
   - Ensure venv module is available

### Error Messages

1. "Error: Python3 is not installed"
   - Install Python3 using your system's package manager

2. "Error: pip3 is not installed"
   - Install pip3 using your system's package manager

3. "Error: Activation script not found"
   - Delete the environment and run the script again
   - Check for corruption in the virtual environment

## Best Practices

1. **Environment Naming**
   - Use descriptive names related to your project
   - Avoid spaces and special characters
   - Consider including Python version for clarity

2. **Project Organization**
   - Keep one environment per project
   - Store requirements.txt in version control
   - Update requirements.txt when adding new dependencies

3. **Version Control**
   - Always use .gitignore to exclude the virtual environment
   - Commit requirements.txt for dependency tracking
   - Document any special environment setup needs

## Security Considerations

1. Never commit virtual environment directories to version control
2. Keep your pip and setuptools packages updated
3. Review requirements.txt for potential security vulnerabilities
4. Use trusted package sources

## Maintenance

To keep your virtual environment healthy:

1. Regularly update pip and core packages
2. Clean up unused dependencies
3. Keep requirements.txt synchronized with actual dependencies
4. Test environment recreation periodically

## Contributing

To contribute to this script:

1. Fork the repository
2. Create a feature branch
3. Submit a pull request with your changes
4. Include Documentation updates

## Support

If you have any questions, feedback, or need assistance, please feel free to contact me:

**Email:** ayobamyahmed@gmail.com

**Twitter:** https://x.com/ahmed_olawale1

---

This documentation is maintained as part of the Virtual Environment Setup Script project. For updates and more information, please refer to the project repository.
