# Registro de atributos de la máquina con Ohai
# Este recurso 'log' muestra información de la máquina virtual utilizando atributos recopilados por Ohai.
log 'Showing machine Ohai attributes' do
  # Mensaje que incluye:
  # - Total de memoria disponible en la máquina ('memory.total').
  # - Número de procesadores disponibles ('cpu.total').
  # - Dirección IP de la interfaz de red 'enp0s8', obtenida dinámicamente a través de Ohai.
  message "Machine with #{node['memory']['total']} of memory and #{node['cpu']['total']} processor/s. \
  \nPlease check access to http://#{node[:network][:interfaces][:enp0s8][:addresses].detect { |k, v| v[:family] == 'inet' }.first}"
end
