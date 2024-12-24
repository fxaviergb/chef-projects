
# Chef and Vagrant Apache Deployment

## Project Objective

This project demonstrates how to provision a virtual machine using **Vagrant** and configure it with **Chef** to deploy a functional Apache web server. The goal is to automate the setup of the web server, including its configuration and deployment of a sample webpage.

## Project Components

### Main Components:
1. **Vagrantfile**:
   - Defines the virtual machine (VM) configuration (e.g., Ubuntu box, network settings).
   - Specifies the provisioning method using Chef.

2. **Chef Recipes**:
   - Automates the installation of Apache, configures its services, and deploys custom configurations.
   - Includes a recipe to deploy a sample webpage.

3. **Templates and Files**:
   - **`templates/`**: Contains an ERB template (`virtual-hosts.conf.erb`) for dynamically generating the Apache virtual host configuration.
   - **`files/`**: Includes static files such as the sample `index.html` webpage.

4. **Attributes**:
   - Defines default attributes (e.g., `default['apache']['document_root'] = "/vagrant"`) for reusable configurations.

## Initialization and Deployment

### Prerequisites:
- Install **Vagrant** and **VirtualBox** on your host machine.
- Ensure the Chef Development Kit (ChefDK) is installed.

### Steps to Initialize the Project:
1. Clone or extract the project repository to your local system.
2. Navigate to the project directory:
   ```bash
   cd chef-vagrant-apache
   ```
3. Start the virtual machine and trigger provisioning with Chef:
   ```bash
   vagrant up
   ```

### Steps to Redeploy or Reprovision:
- If you make changes to the configuration, re-provision the VM:
  ```bash
  vagrant reload --provision
  ```

## Unit Tests

### Location of Unit Tests
- The unit tests are located in the `spec` directory under the cookbook `apache`:
  ```
  cookbooks/apache/spec/
  ```
- The primary test file is `default_spec.rb`.

### Running the Tests
To run the unit tests, follow these steps:
1. Ensure you have ChefDK or Chef Workstation installed.
2. Navigate to the cookbook directory:
   ```bash
   cd cookbooks/apache
   ```
3. Run the tests using the following command:
   ```bash
   chef exec rspec spec
   ```
4. If the tests pass, you should see output indicating all examples succeeded:
   ```
   Finished in 0.1234 seconds
   3 examples, 0 failures
   ```

### What the Tests Validate
- The unit tests verify:
  1. The `apache2` package is installed.
  2. The `apache2` service is defined and configured correctly.
  3. Configuration changes notify the `apache2` service to restart as needed.

## Verification

### Check the Apache Server:
1. Once provisioning is complete, find the IP address specified in the `Vagrantfile` (e.g., `192.168.33.40`).
2. Open a web browser and navigate to:
   ```
   http://192.168.33.40
   ```
3. You should see the sample webpage with a welcome message.

### Check Logs and Status:
- SSH into the virtual machine:
  ```bash
  vagrant ssh
  ```
- Verify Apache is running:
  ```bash
  sudo systemctl status apache2
  ```

## Notes

- The project uses Ubuntu 22.04 (`ubuntu/jammy64`) as the base box. You can update this to a newer version if needed.
- The virtual machine uses a private network for accessibility.

Enjoy automated infrastructure setup with Chef and Vagrant!
