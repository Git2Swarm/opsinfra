server {
    listen       443 default_server;
    server_name  www.agileclouds.com;

    ssl on;
    ssl_certificate /etc/nginx/conf.d/nginx.crt;
    ssl_certificate_key /etc/nginx/conf.d/nginx.key;
    ssl_session_cache shared:SSL:10m;

    location / {

        proxy_pass http://welcomepage:80;
        proxy_set_header Host $host;

        # re-write redirects to http as to https, example: /home
        proxy_redirect http:// https://;
    }

    location /jenkins/ {

        rewrite /infra-sfb/(.*) /$1 break;
        proxy_pass http://jenkins:8080;
        proxy_set_header Host $host;

        # re-write redirects to http as to https, example: /home
        proxy_redirect http:// https://;
    }

    location /applauncher/ {

        #rewrite /applauncher/(.*) /$1 break;
        proxy_pass http://applauncher:5000;
        proxy_set_header Host $host;

        # re-write redirects to http as to https, example: /home
        proxy_redirect http:// https://;
   }

}
