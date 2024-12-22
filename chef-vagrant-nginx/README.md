
# Chef and Vagrant NGINX Deployment

## Project Objective

This project demonstrates the use of **Vagrant** and **Chef** to provision a virtual machine and configure it with **NGINX** as a web server. The primary goal is to automate the setup and deployment process for a web server, providing a functional environment with minimal manual intervention.

## Project Components

### Key Components:
1. **Vagrantfile**:
   - Configures the virtual machine settings, including the base box, networking, and memory allocation.
   - Specifies provisioning steps to integrate Chef for automation.

2. **Chef Recipes**:
   - Automates the installation and configuration of NGINX on the virtual machine.
   - Deploys a sample webpage to demonstrate the server's functionality.

3. **Templates and Static Files**:
   - **`templates/`**: Contains ERB templates for generating NGINX configuration files dynamically based on system attributes.
   - **`files/`**: Includes static resources, such as an example `index.html` file, to be served by NGINX.

4. **Attributes**:
   - Defines default attributes (e.g., `default['nginx']['document_root']`) used in the Chef recipes for reusable and flexible configurations.

## How to Initialize and Deploy

### Prerequisites:
- Install **Vagrant** and **VirtualBox** on your host machine.
- Ensure the Chef Development Kit (ChefDK) is installed.

### Steps to Initialize the Project:
1. Clone or extract the project repository to your local system.
2. Navigate to the project directory:
   ```bash
   cd chef-vagrant-nginx
   ```
3. Start the virtual machine and trigger provisioning with Chef:
   ```bash
   vagrant up
   ```

### Redeploy or Reprovision:
- To apply changes or updates to the configuration, use the following command:
  ```bash
  vagrant reload --provision
  ```

## How to Verify

### Check the NGINX Server:
1. Once provisioning is complete, find the IP address specified in the `Vagrantfile` (e.g., `192.168.33.40`).
2. Open a web browser and visit:
   ```
   http://192.168.33.40
   ```
3. You should see the sample webpage confirming the NGINX server is running.

### Check Logs and Service Status:
- Connect to the virtual machine using SSH:
  ```bash
  vagrant ssh
  ```
- Verify that NGINX is active and running:
  ```bash
  sudo systemctl status nginx
  ```

## Notes

- The project uses Ubuntu as the base box (e.g., `ubuntu/focal64`), which you can update to newer versions if required.
- Ensure that the private network IP does not conflict with your host network configuration.

This project showcases how Vagrant and Chef can streamline server provisioning and setup. Happy deploying!
