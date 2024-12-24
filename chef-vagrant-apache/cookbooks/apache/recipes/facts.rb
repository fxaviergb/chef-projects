# Registro de atributos de la máquina con Ohai
# Este recurso 'log' muestra información de la máquina virtual utilizando atributos recopilados por Ohai.
log 'Showing machine Ohai attributes' do
  # Mensaje que incluye:
  memory_total = node.dig('memory', 'total') || 'unknown'
  cpu_total = node.dig('cpu', 'total') || 'unknown'

  # Verificar la existencia de la interfaz y obtener la dirección IP
  ip_address = node.dig('network', 'interfaces', 'enp0s8', 'addresses')&.detect { |_k, v| v['family'] == 'inet' }&.first
  ip_address ||= 'unavailable'

  message "Machine with #{memory_total} of memory and #{cpu_total} processor/s. \
  \nPlease check access to http://#{ip_address}"
end
