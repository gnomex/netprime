# README

# Apresentação

O desafio consiste em que você crie uma estrutura de visualização de vídeos

## Os critérios de aceitação são:

Para realizar o desafio é necessário implementar uma autenticação. Você pode utilizar uma Gem para isso (Ex: Devise).
É necessário criar um usuário que poderá criar vídeos;
O vídeo deve ter nome e url (url com uma extensão .m3u8);
Um usuário somente poderá realizar o CRUD de seus próprios vídeos;
Criar uma tela para visualização do acervo de vídeos do usuário;
Criar uma tela para a visualização do vídeo que poderá ser acessada por qualquer usuário e deverá conter um player, o nome e a quantidade de visualizações do vídeo;
Contabilizar o view do vídeo quando o player disparar o evento 'start' (incrementar a contagem dos videos view).
Atenção: Para utilizar o player, utilize alguma biblioteca de player js (ex: [VideoJs](http://videojs.github.io/videojs-contrib-hls/)) lendo o arquivo m3u8 https://content.jwplatform.com/manifests/yp34SRmf.m3u8. O player precisa ter o autoplay configurado.

Observação: Seja criativo!

## Importante

* Deve ser desenvolvido utilizando Rails;
* Utilizar base de dados Postgres;
* Deve ter cobertura de testes;
* Utilizar bootstrap ou outro framework semelhante;
* O projeto deverá ser feito no Github ou Gitlab.

### Diferencial

Não se preocupe em entregar uma coisa linda (visual/front), mas todo o código seja front ou back tem que ser limpo, bem escrito e otimizado.

### Entrega

Projeto no github e rodando no heroku


# First

Using ubuntu and having trouble with `Gem::RemoteFetcher::UnknownHostError timed out`?

As long as I see, its a IPv6 routing problem, so, disable it!

```bash
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
```

# Up and Runninig

```
clone and bundle install
sudo docker-compose up -d # otherwise reconfigure config/database.yml

rails db:create
rails db:setup
rails s
```

Example user is `demo@netpri.me`, password `Teste123!@#`

## to edit secrets

`EDITOR=vim rails credentials:edit`

# Deploy to HEROKU

```
heroku create
heroku buildpacks:add --index 1 heroku/nodejs
heroku buildpacks:add heroku/ruby

#git add/commit

git push heroku master

heroku run rails db:migrate
heroku run rails db:seed
```

