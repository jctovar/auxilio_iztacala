#! /bin/bash

# flutter pub run flutter_native_splash:create

flutter build web --web-renderer canvaskit --release

scp -r build/web/ idril:/home/jctovar/www/ixbalanque.fanguye.com/