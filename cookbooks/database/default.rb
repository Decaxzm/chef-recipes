# cookbooks/database/default.rb

# Instala el servidor de MySQL
package 'mysql-server' do
    action :install
  end
  
  # Asegúrate de que el servicio de MySQL esté en ejecución
  service 'mysqld' do
    action [:enable, :start]
  end
  
  # Crea una base de datos y un usuario
  bash 'create_database' do
    code <<-EOH
      mysql -u root -e "CREATE DATABASE mi_base_de_datos;"
      mysql -u root -e "CREATE USER 'mi_usuario'@'localhost' IDENTIFIED BY 'mi_contraseña';"
      mysql -u root -e "GRANT ALL PRIVILEGES ON mi_base_de_datos.* TO 'mi_usuario'@'localhost';"
    EOH
  end
  