# cookbooks/webserver/default.rb

# Instala el paquete de Apache
package 'httpd' do
  action :install
end

# Asegúrate de que el servicio de Apache esté en ejecución
service 'httpd' do
  action [:enable, :start]
end

# Crea una página de prueba
file '/var/www/html/index.html' do
  content '<h1>Hola, mundo!</h1>'
  action :create
end
