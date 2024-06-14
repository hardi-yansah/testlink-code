FROM gitpod/workspace-full

# Install Apache and MySQL
RUN sudo apt-get update && \
    sudo apt-get install -y apache2 mysql-server php php-mysql wget && \
    sudo rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite
RUN sudo a2enmod rewrite

# Configure Apache to Allow .htaccess Files
RUN sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Set the ServerName to avoid warnings
RUN echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/servername.conf && \
    sudo a2enconf servername

# Expose port 8080
EXPOSE 8080
