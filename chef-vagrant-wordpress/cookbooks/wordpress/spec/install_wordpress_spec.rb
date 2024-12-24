require 'chefspec'

describe 'wordpress::install_wordpress' do
    platform 'ubuntu', '22.04'

    # Simular comandos de shell utilizados en la receta. Ayuda a que las llamadas a "not_if" 
    # evaluen las pre-condiciones como falsas para que Chef pueda ejecutar los comandos.
    before do
        stub_command("mysql -uroot -e 'SHOW DATABASES;' | grep wordpress").and_return(false)
    end

    # Verifica que se instala el paquete apache2
    it 'installs the apache2 package' do
        expect(chef_run).to install_package('apache2')
    end

    # Verifica que se instala el paquete php
    it 'installs the php package' do
        expect(chef_run).to install_package('php') 
    end

    # Verifica que se instala el paquete mysql-server
    it 'installs the mysql-server package' do
        expect(chef_run).to install_package('mysql-server')
    end
end
