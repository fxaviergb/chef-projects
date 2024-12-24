require 'chefspec' # Importa la biblioteca ChefSpec para escribir y ejecutar pruebas unitarias.

describe 'apache::default' do
  # Configura la plataforma y versión del sistema operativo para las pruebas simuladas.
  platform 'ubuntu', '22.04'

  # Verifica que el paquete 'apache2' sea instalado por la receta.
  it 'installs the apache2 package' do
    # Comprueba que el recurso package 'apache2' exista y esté configurado con la acción :install.
    expect(chef_run).to install_package('apache2')
  end

  # Valida que el servicio 'apache2' esté definido correctamente con las propiedades especificadas.
  it 'defines the apache2 service' do
    # Verifica que el recurso service 'apache2' esté configurado con acción :nothing.
    expect(chef_run).to nothing_service('apache2').with(
      # Comprueba que el soporte para el estado del servicio esté habilitado.
      supports: { status: true }
    )
  end  

  # Comprueba que un recurso notifique al servicio 'apache2' para reiniciarse de forma diferida.
  it 'notifies the apache2 service to restart' do
    # Simula la existencia de un archivo de configuración en '/etc/apache2/sites-available/vagrant.conf'.
    # Reemplaza '/etc/apache2/sites-available/vagrant.conf' con el recurso exacto que emite la notificación en la receta.
    resource = chef_run.template('/etc/apache2/sites-available/vagrant.conf')

    # Verifica que el recurso 'template' notifique al servicio 'apache2' con la acción :restart de manera diferida (delayed).
    expect(resource).to notify('service[apache2]').to(:restart).delayed
  end
end
