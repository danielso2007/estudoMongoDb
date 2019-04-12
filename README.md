# MongoDB

[Documentação](https://docs.mongodb.com/manual/tutorial/getting-started/)

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
```shell
show dbs
```

Acessando banco de dados:
```shell
use db_finance
```

Exibir banco atual:
```shell
db
```

Criando coleção:
```shell
db.createCollection("billingcycles")
```

Exibir collections:
```shell
show collections
```

Deletando collections:
```shell
db.billingcycles.drop()
```

Inserindo dados:
```shell
db.billingcycles.insert({name: "Janeiro/17", month: 1, year: 2017})
```
Ou
```shell
db.billingcycles.insert({

# Digitando:
db.billingcycles.insert({ name: "Março/17", month: 3, year: 2017, credits: [ {name: "Salário", value: 5000} ], debts: [ {name: "Luz", value: 100, status: "PAGO"}, {name: "Telefone", value: 120, status: "PENDENTE"} ] })
```

Salvando/atualizando dados:
```shell
db.billingcycles.save({name: "Fevereiro/17", month: 2, year: 2017})
```

Update dados:
```shell
db.billingcycles.update({$and:[{month: 1}, {year:2017}]}, {$set:{credits:[{name:"Salário", value: 2800}], debts:[{name:"Luz", value: 500, status: "PAGO"}]}})
```

Pesquisando todos os registros:
```
db.billingcycles.find()

# ou
db.billingcycles.find().pretty()
```

Pesquisar o primeiro registro:
```shell
db.billingcycles.findOne()
```

Pesquisar registro com filtro:
```shell
db.billingcycles.findOne({month: 2})
```

Pesquisar com `ou`:
```shell
db.billingcycles.find({ $or: [{month: 1}, {month: 2}] }).pretty()
```

Pesquisar que possuem credits:
```shell
db.billingcycles.find({credits: {$exists: true}}).pretty()

db.billingcycles.find({credits: {$exists: true}}, {_id: 0, name: 1}).pretty()
```

Pesquisar com skip:
```shell
db.billingcycles.find({year: 2017}).skip(1)
```

Pesquisar com limit:
```shell
db.billingcycles.find({year: 2017}).skip(1).limit(1)
```

Aggregate:
```JSON
db.billingcycles.aggregate([{$project:{credit:{$sum:"$credits.value"},debt:{$sum:"$debts.value"}}}, {$group:{_id: null, credit:{$sum:"$credit"}, debt:{$sum:"$debt"}}}])
```

Aggregate, somando apenas os créditos e débitos de cada registro:
```JSON
db.billingcycles.aggregate([{$project:{credit:{$sum:"$credits.value"},debt:{$sum:"$debts.value"}}}])
```

Contador:
```shell
db.billingcycles.count()
```

Remove:
```shell
db.billingcycles.remove({month: 2})

db.billingcycles.remove({year: 2017}, 1)
```

Removendo o banco de dados:
```shell
db.dropDatabase()
```