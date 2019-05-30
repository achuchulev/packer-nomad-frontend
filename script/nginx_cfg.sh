cat <<EOF > /etc/nginx/sites-available/default

upstream nomad_backend { 
    server 192.168.10.11:4646;
    server 192.168.10.12:4646;
    server 192.168.10.13:4646;
 } 

server {

    listen 80 default_server;
    server_name localhost;

    location / {
        proxy_pass http://nomad_backend;
    }
}
EOF