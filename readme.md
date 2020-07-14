# Node.js Docker Travis Example

## Demo

https://docker-travis-node-example.herokuapp.com/

## Usage

`docker build -t nodehwi .`  
`docker run -p 8000:8000 -d --name hde nodehwi:latest`  
`docker exec -it hde sh -c "npm test"`

## My Notes

### Docker

#### Dockerfile

```Dockerfile
FROM node:14.4-alpine

WORKDIR /usr/src/app
COPY . .

RUN npm i

CMD ["npm", "start"]
```

#### Commands

- `docker images`

- `docker container ls -a`  
  `docker ps --all`  
  List all containers (Even if not running)
- `docker build -t <image-name> .`  
  где `-t <image-name>` - задать имя имаджу

- `docker run -p 8000:8000 <image-name>:latest`  
  где `-p 8000:8000` - (--publish) маппинг порта контейнера(8000) к порту компа(8000)  
  `docker run -p 8000:8000 -d --name <container-name> <image-name>:latest`  
  где `-d` - (detached) запуск в фоне, а `--name <container-name>` задает имя контейнеру

- `docker attach <container-name>`  
  Подключение к detached контейнеру, `cmd-c` - останавливает контейнер!
  will take you inside the bash terminal as it's PID 1 as we mentioned while starting the container. Exiting out from the container will stop the container.  
  `docker exec -it <container-name> bash`  
  `docker exec -it <container-name> sh`  
  `docker exec -it <container-name> sh -c "npm test"`

* `docker rm <container-name> --force`  
  = `docker stop <container-name>` + `docker rm <container-name>`

### Travis

1. Авторизовать travis-ci приложение
2. Создать .travis.yml
3. git push
4. open \<repo-name> in https://travis-ci.com/

#### .travis.yml

https://docs.travis-ci.com/user/languages/javascript-with-nodejs/

```yaml
language: node_js
node_js:
  - 14
```

#### CLI

1. `gem install travis`
2. `travis login --pro`
3. `travis setup heroku`

encrypt  
`travis encrypt <api_key>`

### Heroku

1. `npm install -g heroku`
2. `heroku login -i`
3. `heroku authorizations:create`  
    production  
   `heroku auth:token`  
    develop
