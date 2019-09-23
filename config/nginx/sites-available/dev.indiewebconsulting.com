server {
        listen 80;
        listen [::]:80;
        server_name dev.indiewebconsulting.com;
        return 301 https://$server_name$request_uri;
}

server {
        listen 443 http2 ssl;
	listen [::]:443 http2 ssl;
        server_name dev.indiewebconsulting.com;
	root /var/www/html/prod/homepage/build;
        add_header Strict-Transport-Security "max-age=31536000";
        ssl_certificate /etc/letsencrypt/live/dev.indiewebconsulting.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/dev.indiewebconsulting.com/privkey.pem;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:AES256+ECDHE';
	index index.html index.htm;
	location / {
		try_files $uri $uri/ =404;
	}
}
     
