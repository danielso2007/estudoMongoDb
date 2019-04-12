# Exemplo de permissões linux:

[todoespacoonline.com/w/2015/06/usuarios-grupos-e-permissoes-no-linux-ubuntu/](https://www.todoespacoonline.com/w/2015/06/usuarios-grupos-e-permissoes-no-linux-ubuntu/)


# Instalar o MongoDB:

[mongodb.com/download-center/community](https://www.mongodb.com/download-center/community)

- Copiar Node em: `/opt/mongodb: sudo mv node /opt/mongodb`
- Modificar environment: `sudo nano /etc/environment`
- Adicionar no final: `/etc/mongodb/bin`
- Compilando a modificação: `source /etc/environment`
- Criar pasta `/data/db: /data/db`
- Adicionar a pasta ao grupo do usuário: 
  - Listar grupos: `less /etc/group`
  - Listar usuários: `getent passwd | cut -d \: -f1`
  - Dando a permissão: `sudo chown daniel.oliveira:’domain users’ /data -R`
  - Permissão na pasta: `sudo chmod 2770 /data/ -R`


# MongoDB Compass:

[mongodb.com/download-center/compass](https://www.mongodb.com/download-center/compass)


# Comandos básicos:

Exibir bancos de dados:
```
show dbs
```

Acessando banco de dados:
```
use db_finance
```

Exibir banco atual:
```
db
```

Criando coleção:
```
db.createCollection(billingcycles)
```

Exibir collections:
```
show collections
```

Deletando collections:
```
db.billingcycles.drop()
```

Inserindo dados:
```
db.billingcycles.insert({name: "Janeiro/17", month: 1, year: 2017})
```


