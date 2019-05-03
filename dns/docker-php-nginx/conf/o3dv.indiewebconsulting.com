server {
        listen 80;
        listen [::]:80;
        server_name o3dv.indiewebconsulting.com;
        return 301 https://$server_name$request_uri;
}

server {
        listen 443 ssl;
	listen [::]:443;
        server_name o3dv.indiewebconsulting.com;
	root /var/www/html/prod/rubix-demos
        add_header Strict-Transport-Security "max-age=31536000";
        ssl_certificate /etc/letsencrypt/live/o3dv.indiewebconsulting.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/o3dv.indiewebconsulting.com/privkey.pem;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:AES256+ECDHE';
	index index.html;
	location / {
		try_files $uri $uri/ =404;
	}
}
     
