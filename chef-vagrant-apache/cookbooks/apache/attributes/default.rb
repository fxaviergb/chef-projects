# Atributo predeterminado para el directorio raíz de documentos de Apache
# Este atributo define la ubicación del directorio que servirá como raíz para los archivos del servidor web.
# En este caso, está configurado para usar el directorio '/vagrant', que normalmente está sincronizado
# con el sistema host en un entorno Vagrant.
default['apache']['document_root'] = "/vagrant"