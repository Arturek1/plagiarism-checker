install: file-permission dependency-install migration generate-app-key optimize
install-dev: file-permission dependency-install migration generate-app-key optimize

file-permission:
	chmod -R 777 storage
	chmod 775 bootstrap/cache/

migration:
	php artisan migrate:reset
	php artisan migrate --seed

generate-app-key:
	php artisan key:generate

dependency-install:
	composer install

optimize:
	php artisan route:cache
	php artisan cache:clear
	php artisan view:clear
	php artisan route:clear
	php artisan config:cache
	php artisan config:clear 

random-avatar:
	php artisan avatar:random
