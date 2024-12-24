require 'chefspec'

describe 'wordpress::configure_wordpress' do
    platform 'ubuntu', '22.04'

    # Simular comandos de shell utilizados en la receta. Ayuda a que las llamadas a "not_if" 
    # evaluen las pre-condiciones como falsas para que Chef pueda ejecutar los comandos.
    before do
        stub_command("sudo -u www-data wp core is-installed --path=/var/www/html/wordpress").and_return(false)
        stub_command("sudo -u www-data wp theme list --path=/var/www/html/wordpress | grep 'astra' | grep 'Active'").and_return(false)
        stub_command("sudo -u www-data wp user list --path=/var/www/html/wordpress | grep jhon_doe").and_return(false)
        stub_command("sudo -u www-data wp term list category --path=/var/www/html/wordpress | grep DEVOPS").and_return(false)
        stub_command("sudo -u www-data wp post list --path=/var/www/html/wordpress | grep 'CHEF: Continuous Configuration Automation'").and_return(false)
    end

    # Verifica que se ejecute el bloque 'bash' para instalar WordPress.
    # Comprueba que el comando 'wp core install' esté presente en el bloque.
    it 'executes the bash block to install WordPress' do
        expect(chef_run).to run_bash('install_wordpress').with(
            cwd: '/var/www/html/wordpress', 
            code: /wp core install/ 
        )
    end

    # Verifica que se ejecute el bloque 'bash' para crear un post.
    # Comprueba que el comando 'wp post create' esté presente en el bloque.
    it 'executes the bash block to create a post' do
        expect(chef_run).to run_bash('create_wp_post_from_file').with(
            cwd: '/var/www/html/wordpress',
            code: /wp post create/ 
        )
    end

    # Verifica que se ejecute el bloque 'bash' para configurar la sección de blogs como página de inicio.
    # Comprueba que el comando 'wp option update show_on_front' esté presente en el bloque.
    it 'executes the bash block to set the homepage to blog' do
        expect(chef_run).to run_bash('set_homepage_to_blog').with(
            cwd: '/var/www/html/wordpress', 
            code: /wp option update show_on_front/ 
        )
    end
end
