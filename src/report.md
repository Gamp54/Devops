## Part 1. Готовый докер

* Взять официальный докер образ с **nginx** и выкачать его при помощи ```docker pull```
![docker pull](img/1-1.png)

* Проверить наличие докер образа через ```docker images```
![docker images](img/1-2.png)

* Запустить докер образ через ```docker run -d [image_id|repository]```
![docker run](img/1-3.png)

* Проверить, что образ запустился через ```docker ps```
![running](img/1-4.png)

* Посмотреть информацию о контейнере через ```docker inspect [container_id|container_name]```

```
"ShmSize": 67108864,
"Ports": {"80/tcp": null},
"IPAddress": "172.17.0.2"
```

* Остановить докер образ через ```docker stop [container_id|container_name]```
![docker stop](img/1-5.png)

* Проверить, что образ остановился через ```docker ps```
![docker ps](img/1-6.png)

* Запустить докер с замапленными портами 80 и 443 на локальную машину через команду *run*
![run -p](img/1-7.png)

* Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
![web](img/1-8.png)

* Перезапустить докер контейнер через ```docker restart [container_id|container_name]```
![restart](img/1-9.png)

* Проверить любым способом, что контейнер запустился
![OK](img/1-10.png)

## Part 2. Операции с контейнером

* Прочитать конфигурационный файл *nginx.conf* внутри докер образа через команду *exec*
![exec](img/2-1.png)

* Создать на локальной машине файл *nginx.conf*. Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
![nginx.conf](img/2-2.png)

* Скопировать созданный файл *nginx.conf* внутрь докер образа через команду docker ```cp```
![docker cp](img/2-3.png)

* Перезапустить **nginx** внутри докер образа через команду *exec*
![docker exec](img/2-4.png)

* Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
![status](img/2-5.png)

* Экспортировать контейнер в файл *container.tar* через команду *export*
![export](img/2-6.png)

* Остановить контейнер
![stop](img/2-7.png)

* Удалить образ через ```docker rmi image_id|repository]```, не удаляя перед этим контейнеры
![remove](img/2-8.png)

* Импортировать контейнер обратно через команду *import*
![import](img/2-9.png)

* Запустить импортированный контейнер
![start](img/2-10.png)
