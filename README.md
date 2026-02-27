# Template_Setup for Ubuntu and Debian
Before Converting to Template and Post Clone Scripts to Quickly setup your VM

## 1. Install Dependencies and Clone the Repository
1. Install Git
    ```bash
    sudo apt install git
    ```  
2. Git Clone My Repository to the Linux VM that you want to make into a Template
    ```bash
    git clone https://github.com/Jason2604-cpu/Template_Setup.git
    ```
## 2. Configure your config file first 

1. Navigate to the folder where you store the project:
    ```bash
    cd Template_setup
    ```
2. Change the config.env to your desire
    ```bash
    nano config.env
    ```
For Example:
HOSTNAME= ABCD1234
USERNAME= gandalf

## 3. Make your VM Template ready Note: Do this before you shutdown your VM

1. Navigate to the folder where you store the project:
    ```bash
    cd Template_setup
    ```
2. Make the pre-template.sh Executeable
   ```bash
   chmod +x pre-template.sh
   ```
3. Run the script
   ```bash
   sudo ./pre-template.sh
   ```
4. Shutdown the server
   ```bash
   sudo shutdown now
   ```
5. After shutting the server, you may turn it into a template

## 3. Post Clone for the Template

1. Navigate to the folder
    ```bash
    cd Template_setup
    ```
2. Run the script
   ```bash
   sudo ./firstboot.sh
   ```
3. Reboot the server
   ```bash
   sudo reboot now
   ```


