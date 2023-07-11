# Oembed Test

데이터베이스를 사용하여 providers 정보를 관리하기로 결정하였습니다. 그러므로 시작하시기 전, 커맨드창에서 아래 명령어를 입력하시길 바랍니다

```
rails db:create
rails db:migrate

rails db:seed
```

db에 데이터 입력 후 서버를 키시면 아래 에러가 뜨게 됩니다.
```
Webpacker::Manifest::MissingEntryError
```

이를 방지위해 `yarn` 명령어를 실행시킨 후 다시 서버를 키시기 바랍니다. 
> 만약 `yarn` 명령어로도 에러가 사라지지 않는다면 `rails webpacker:install`로 웹팩커 재설치 후 서버 실행 부탁드립니다.
 
위 명령어 실행후 아래 명령어로 서버를 시작하시길 바랍니다.

```
./bin/dev
```
