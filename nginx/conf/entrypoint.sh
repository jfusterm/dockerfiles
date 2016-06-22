#!/bin/sh

set -e

gen_default(){
cat << EOF
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;

    access_log  log/host.access.log  main;

    location / {
        root   html;
        index  index.html index.htm;
    }

    error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   html;
    }
}
EOF
}

gen_upstream(){ 
   echo "upstream phpfpm {" 
   for server in $(echo $PHPFPM | sed 's/,/ /g' );do
       echo "    server $server;"
   done
   echo "}"    
}

gen_phpfpm(){
cat << EOF
server {
    listen       80;

    charset koi8-r;
    #access_log  /nginx/log/host.access.log  main;

    root html;
    index index.php;

    error_page  404              /404.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
	fastcgi_pass phpfpm;
        include /nginx/etc/fastcgi_params;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
    
    # deny access to .git directories
    location ~ /\.git {
        deny  all;
    }
    
    location /status {
        stub_status on;
        access_log off;
        allow 127.0.0.1;
        deny all;
    }
         
    location ~ ^/(phpfpm_status|ping)$ {
        access_log off;
        allow 127.0.0.1;
        deny all;
        include /nginx/etc/fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_pass phpfpm;
    } 
}
EOF
}

if [ -n "$PHPFPM" ];then
    gen_phpfpm > /nginx/etc/conf.d/php-fpm.conf
    gen_upstream > /nginx/etc/conf.d/upstream.conf
else
    gen_default > /nginx/etc/conf.d/default.conf
fi

exec "$@"
