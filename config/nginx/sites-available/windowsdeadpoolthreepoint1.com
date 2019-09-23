server {
        listen 80;
        listen [::]:80;
        server_name www.windowsdeadpoolthreepoint1.com windowsdeadpoolthreepoint1.com;
        return 301 https://$server_name$request_uri;
}

server {
        listen 443 http2 ssl;
	listen [::]:443 http2 ssl;
        server_name www.windowsdeadpoolthreepoint1.com;

        add_header Strict-Transport-Security "max-age=31536000";
        ssl_certificate /etc/letsencrypt/live/www.windowsdeadpoolthreepoint1.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/www.windowsdeadpoolthreepoint1.com/privkey.pem;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:AES256+ECDHE';

	location / {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_pass http://127.0.0.1:8001;
	}
}

server {
        listen 443 http2 ssl;
	listen [::]:443 http2 ssl;
        server_name windowsdeadpoolthreepoint1.com;

        add_header Strict-Transport-Security "max-age=31536000";
        ssl_certificate /etc/letsencrypt/live/windowsdeadpoolthreepoint1.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/windowsdeadpoolthreepoint1.com/privkey.pem;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:AES256+ECDHE';

	location / {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_pass http://127.0.0.1:8001;
	}
}
     
