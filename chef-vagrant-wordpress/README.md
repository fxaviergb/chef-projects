# WordPress Deployment with Chef and Vagrant

This project automates the deployment of a WordPress environment on an Ubuntu-based virtual machine using Vagrant and Chef. The objective is to provide a seamless, reproducible setup for WordPress development or testing.

## Project Structure

The repository includes:

- **Vagrantfile**: Configuration file for setting up the virtual machine.
- **Cookbooks**: Chef recipes and templates for installing and configuring WordPress.
- **Templates**: Configuration files for WordPress (e.g., `wordpress.conf.erb`, `wp-config.php.erb`).
- **Recipes**: Specific Chef scripts for tasks like installing and configuring WordPress.

## Prerequisites

To use this project, ensure your system meets the following requirements:

- **Vagrant**: Installed on your local machine. [Download Vagrant](https://www.vagrantup.com/downloads).
- **VirtualBox**: Installed as the default provider for Vagrant. [Download VirtualBox](https://www.virtualbox.org/).
- **ChefDK** (optional): Installed if you want to customize the recipes. [Download ChefDK](https://downloads.chef.io/chefdk).

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd chef-vagrant-wordpress
   ```

2. **Start the Virtual Machine**
   Run the following command to spin up the virtual machine:
   ```bash
   vagrant up
   ```
   This command will:
   - Download the base Ubuntu image (if not already available).
   - Provision the virtual machine using Chef recipes to install and configure WordPress.

3. **Access the Virtual Machine**
   Once the VM is up, you can access it via SSH:
   ```bash
   vagrant ssh
   ```

## Verifying the Setup

1. **WordPress Access**
   - Open a browser on your host machine.
   - Navigate to `http://192.168.33.10` (or the port specified in the `Vagrantfile`).

2. **Login Details**
   - Default WordPress admin credentials are set during provisioning. Refer to the `wp-config.php.erb` template for details or customize it before provisioning.

## Customization

To customize the setup:
- Modify the `Vagrantfile` to adjust virtual machine settings (e.g., memory, CPU).
- Edit the Chef recipes in the `cookbooks/wordpress/recipes` directory.
- Update templates in the `cookbooks/wordpress/templates` directory for WordPress configuration.

## Troubleshooting

- If the provisioning fails, retry with:
  ```bash
  vagrant provision
  ```
- To destroy and recreate the VM, use:
  ```bash
  vagrant destroy -f
  vagrant up
  ```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
