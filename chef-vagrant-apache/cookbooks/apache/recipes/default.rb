# Actualización del caché de paquetes APT
# Este recurso actualiza el caché de APT cada 24 horas (86400 segundos).
apt_update 'Update the apt cache daily' do
    frequency 86400
    action :periodic
end
  
# Instalación de Apache
# Instala el paquete 'apache2' usando el gestor de paquetes del sistema.
package 'apache2' do
  action :install
end

# Configuración del servicio Apache
# Configura el servicio 'apache2' y permite que Chef gestione su estado.
# Aquí no se realiza ninguna acción inmediatamente, pero el servicio puede ser notificado más adelante.
service 'apache2' do
  supports :status => true
  action :nothing
end

# Eliminación de la configuración predeterminada de Apache
# Elimina el archivo '000-default.conf' para evitar conflictos con configuraciones personalizadas.
file '/etc/apache2/sites-enabled/000-default.conf' do
  action :delete
end

# Creación de un archivo de configuración personalizado
# Usa una plantilla (virtual-hosts.conf.erb) para generar el archivo de configuración
# del host virtual en '/etc/apache2/sites-available/vagrant.conf'.
# Notifica al servicio Apache que debe reiniciarse si este archivo cambia.
template '/etc/apache2/sites-available/vagrant.conf' do
  source 'virtual-hosts.conf.erb'
  notifies :restart, resources(:service => "apache2")
end

# Creación de un enlace simbólico
# Crea un enlace simbólico hacia el archivo de configuración en 'sites-enabled',
# habilitando el host virtual. También notifica al servicio Apache que debe reiniciarse.
link '/etc/apache2/sites-enabled/vagrant.conf' do
  to '/etc/apache2/sites-available/vagrant.conf'
  notifies :restart, resources(:service => "apache2")
end

# Copia de un archivo HTML al directorio raíz del servidor
# Copia el archivo 'index.html' desde el directorio de cookbooks al directorio raíz del servidor web,
# pero solo si el archivo de configuración del host virtual existe.
cookbook_file "#{node['apache']['document_root']}/index.html" do
  source 'index.html'
  only_if do
    File.exist?('/etc/apache2/sites-enabled/vagrant.conf')
  end
end

# Inclusión de otra receta
# Incluye una receta adicional llamada 'facts', que puede contener configuraciones complementarias.
include_recipe '::facts'
