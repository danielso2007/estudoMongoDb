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
db.createCollection("billingcycles")
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
Ou
```
db.billingcycles.insert({

# Digitando:
db.billingcycles.insert({ name: "Março/17", month: 3, year: 2017, credits: [ {name: "Salário", value: 5000} ], debts: [ {name: "Luz", value: 100, status: "PAGO"}, {name: "Telefone", value: 120, status: "PENDENTE"} ] })
```

Salvando/atualizando dados:
```
db.billingcycles.save({name: "Fevereiro/17", month: 2, year: 2017})
```

Update dados:
```
db.billingcycles.update({$and:[{month: 1}, {year:2017}]}, {$set:{credits:[{name:"Salário", value: 2800}], debts:[{name:"Luz", value: 500, status: "PAGO"}]}})
```

Pesquisando todos os registros:
```
db.billingcycles.find()

# ou
db.billingcycles.find().pretty()
```

Pesquisar o primeiro registro:
```
db.billingcycles.findOne()
```

Pesquisar registro com filtro:
```
db.billingcycles.findOne({month: 2})
```

Pesquisar com `ou`:
```
db.billingcycles.find({ $or: [{month: 1}, {month: 2}] }).pretty()
```

Pesquisar que possuem credits:
```
db.billingcycles.find({credits: {$exists: true}}).pretty()

db.billingcycles.find({credits: {$exists: true}}, {_id: 0, name: 1}).pretty()
```

Pesquisar com skip:
```
db.billingcycles.find({year: 2017}).skip(1)
```

Pesquisar com limit:
```
db.billingcycles.find({year: 2017}).skip(1).limit(1)
```

Aggregate:
```
db.billingcycles.aggregate([{$project:{credit:{$sum:"$credits.value"},debt:{$sum:"$debts.value"}}}, {$group:{_id: null, credit:{$sum:"$credit"}, debt:{$sum:"$debt"}}}])
```

Aggregate, somando apenas os créditos e débitos de cada registro:
```
db.billingcycles.aggregate([{$project:{credit:{$sum:"$credits.value"},debt:{$sum:"$debts.value"}}}])
```

Contador:
```
db.billingcycles.count()
```

Remove:
```
db.billingcycles.remove({month: 2})

db.billingcycles.remove({year: 2017}, 1)
```

Removendo o banco de dados:
```
db.dropDatabase()
```

# ESTUDO DE MONGODB

Pequeno projeto de estudo para o banco de dados noSql MongoDB.

# INSTALAÇÃO NO LINUX

Criar pasta para dados dando permissão ao MongoDB:
```
mkdir /data/db
```

Entrar na pasta aonde fica localizado o executável do MongoDB:
```
cd ~/mongodb/bin
```

Inicializar o serviço do banco de dados MongoDB:
```
./mongod --port 27017 --dbpath /data/db
```

# INTRODUÇÃO

Mostrar bancos de dados disponíveis no servidor:
```
show dbs
```

Usar um determinado banco de dados:
```
use estudomongodb
```

Criar uma collection:
```
db.createCollection('funcionarios')
```

Eliminar um banco de dados __(É importante selecionar o banco de dados)__:
```
use cursomongodb2
db.dropDatabase();
```

Exibir Collections:
```
show collections
```

Remover todos os documentos de uma collection:
```
db.postagens.remove({})
```

Dropar uma collection:
```
db.postagens.drop();
```

# EXEMPLOS DE INSERÇÃO E CONSULTA DE DADOS

Inserir dados (documentos) em uma collection:
```
use mobiledb
db.postagens.insert( {titulo: 'Primeira Postagem', conteudo: 'Conteudo 01', tags: []} )
db.postagens.insert( {titulo: 'Segunda Postagem', conteudo: 'Conteudo 02', tags: []} )
db.postagens.insert( {titulo: 'Terceira Postagem', conteudo: 'Conteudo 03', tags: ['esporte', 'cinema', 'praia']} )
db.postagens.insert( {titulo: 'Quarto Postagem', conteudo: 'Conteudo 04', tags: ['praia', 'games', 'livros']} )
db.postagens.insert( {titulo: 'Quinto Postagem', conteudo: 'Conteudo 05', tags: ['cinema']} )
db.postagens.insert( {titulo: 'Sexto Postagem', conteudo: 'Conteudo 06', tags: ['estudo', 'cinema', 'viagem']} )
db.postagens.insert( {titulo: 'Lorem ipsum dolor sit amet', conteudo: 'Conteudo 07', tags: ['livros']} )
db.postagens.insert( {titulo: 'Sed mi metus', conteudo: 'Conteudo 08', tags: ['cinema']} )
db.postagens.insert( {titulo: 'Sed et dui eget massa pretium posuere eget a eros', conteudo: 'Conteudo 09', tags: ['praia']} )
db.postagens.insert( {titulo: 'Cras tempor consectetur quam sed consequat', conteudo: 'Conteudo 10', tags: ['esporte', 'estudo']} )
```

Mostrar todos os dados da collection:
```
db.postagens.find();
```

Exibir os dados formatados:
```
db.postagens.find().pretty();
```


Limitar a quantidade de registros retornados na consulta:
```
db.postagens.find().limit(2).pretty();
```
```
db.postagens.find().pretty().limit(2);
```


## Principais metodos para consultar dados: findOne() vs find()


Ordenar resultados:
```
db.postagens.find().sort({titulo: 1});
```

Limitar a quantide de registros retornados e exibir de forma ordenada:
```
db.postagens.find().sort({titulo: 1}).limit(2);
```

Realizar a Projeção de Atributos (seleção dos atributos a serem exibidos):
```
db.postagens.find({}, {titulo: true})
```

Por padrão, o mongodb retorna o atributo "_id" nas consultas. Caso queira não exibir este atributo, basta adicionar o atributo "_id" na projeção com o seu valor para "false":
```
db.postagens.find({}, {titulo: true, _id: false}).sort({titulo: 1})
```

Consultar os documentos com titulo "Primeira Postagem":
```
db.postagens.findOne({titulo: 'Primeira Postagem'})
```

Consultar os documentos com um atributo inexistente "nome". Como o mongo não trabalha como esquema rigido, não haverá nenhum erro, apesar, claro, de não ser retornado nenhum resultado pois nao existe nenhum documento com este atributo:
```
db.postagens.findOne({nome: 'Primeira Postagem'})
```
Atualizando o registro:
```
db.postagens.update({"titulo": "Primeira Postagem"}, {$set: {"conteudo": "Conteúdo alterado", "tags": ['airsoft', 'paintball']}})
db.postagens.findOne({"titulo": "Primeira Postagem"})
```
```
db.postagens.update({"titulo": "Primeira Postagem"}, {$set: {"conteudo": "Conteúdo 01", "tags": []}})
db.postagens.findOne({"titulo": "Primeira Postagem"})
```

Pesquisando registros que iniciam com "T"
```
db.postagens.find({titulo: /^T/})
```

Removendo registros que iniciam com "T"
```
db.postagens.remove({titulo: /^T/})
```


# OUTROS EXEMPLOS DE INSERÇÃO E CONSULTA DE DADOS (DOCUMENTOS)

Inserir um documento com array e documentos aninhados:
```
db.estoque.insert(
   {
     item: "ABC1",
     detalhes: {
        modelo: "14Q3",
        fabricante: "XYZ Empresa"
     },
     itensestoque: [ { tamanho: "S", qtde: 25 }, { tamanho: "M", qtde: 50 } ],
     categoria: "roupas"
   }
)
```

Verificar o documento inserido:
```
db.estoque.find().pretty();
```

Inserir um Array de Documentos:
```
var meusdocumentos =
    [
      {
        item: "ABC2",
        detalhes: { modelo: "14Q3", fabricante: "M1 Corporation" },
        itensestoque: [ { tamanho: "M", qtde: 50 } ],
        categoria: "roupas"
      },
      {
        item: "MNO2",
        detalhes: { modelo: "14Q3", fabricante: "ABC Empresa" },
        itensestoque: [ { tamanho: "S", qtde: 5 }, { tamanho: "M", qtde: 5 }, { tamanho: "L", qtde: 1 } ],
        categoria: "roupas"
      },
      {
        item: "IJK2",
        detalhes: { modelo: "14Q2", fabricante: "M5 Corporation" },
        itensestoque: [ { tamanho: "S", qtde: 5 }, { tamanho: "L", qtde: 1 } ],
        categoria: "utensílios domésticos"
      },
      {
        item: "IJE3",
        detalhes: { modelo: "1232", fabricante: "M64 Corporation" },
        itensestoque: [ { tamanho: "S", qtde: 15 }, { tamanho: "G", qtde: 4 } ],
        categoria: "utensílios domésticos"
      },
      {
        item: "UYE6",
        detalhes: { modelo: "6YT5", fabricante: "M5 Corporation" },
        itensestoque: [ { tamanho: "S", qtde: 6 }, { tamanho: "L", qtde: 11 } ],
        categoria: "roupas"
      }
    ]

db.estoque.insert(meusdocumentos)
```

Inserir múltiplos documentos utilizando o "bulk":
```
var bulk = db.estoque.initializeUnorderedBulkOp()

bulk.insert(
   {
     item: "BE10",
     detalhes: { modelo: "14Q2", fabricante: "XYZ Empresa" },
     itensestoque: [ { tamanho: "L", qtde: 5 } ],
     categoria: "roupas"
   }
)

bulk.insert(
   {
     item: "ZYT1",
     detalhes: { modelo: "14Q1", fabricante: "ABC Empresa"  },
     itensestoque: [ { tamanho: "S", qtde: 5 }, { tamanho: "M", qtde: 5 } ],
     categoria: "utensílios domésticos"
   }
)

bulk.insert(
   {
     item: "OIR8",
     detalhes: { modelo: "12W7", fabricante: "ABC Empresa"  },
     itensestoque: [ { tamanho: "S", qtde: 15 }, { tamanho: "M", qtde: 15 }, { tamanho: "G", qtde: 1 } ],
     categoria: "roupas"
   }
)

bulk.execute()
```

Consulta especificando uma condição de igualdade:
```
db.estoque.find( { categoria: "roupas" } ).pretty()
```

Consulta especificando uma condição "in":
```
db.estoque.find( { categoria: { $in: [ 'roupas', 'utensílios domésticos' ] } } ).pretty()
```

Consulta especificando uma condição "AND" e "MENOR QUE":
```
db.estoque.find( { categoria: 'roupas', "itensestoque.qtde": { $lt: 10 } } ).pretty()
```

Contar a quantidade de registros retornados na consulta:
```
db.estoque.count()
```
```
db.estoque.find( { categoria: 'roupas', "itensestoque.qtde": { $lt: 10 } } ).count()
```

Consulta especificando uma condição "OR":
```
db.estoque.find(
   {
     $or: [ { "itensestoque.qtde": { $lt: 10 } }, { "itensestoque.qtde": { $gt: 20 } } ]
   }
).pretty()
```

Consulta especificando condição "AND" e "OR":
```
db.estoque.find(
   {
     categoria: 'roupas',
     $or: [ { "itensestoque.qtde": { $lt: 10 } }, { "itensestoque.qtde": { $gt: 20 } } ]
   }
).pretty()
```

# EXEMPLOS DE ALTERAÇÃO DE DADOS (DOCUMENTOS)

Atualizar atributos específicos no documento (usar o operador "set"):
```
db.estoque.update(
    { item: "MNO2" },
    {
      $set: {
        categoria: "eletrônicos",
        detalhes: { modelo: "14Q3", fabricante: "XYZ Empresa" }
      },
      $currentDate: { lastModified: true }
    }
)
```

Atualizar um atributo em um documento aninhado:
```
db.estoque.update(
  { item: "ABC1" },
  { $set: { "detalhes.modelo": "14Q2" } }
)
```


Atualizar múltiplos documentos:
```
db.estoque.update(
   { categoria: "roupas" },
   {
     $set: { categoria: "eletrônicos" },
     $currentDate: { lastModified: true }
   },
   { multi: true }
)
```


Substituir o documento:
```
db.estoque.update(
   { item: "BE10" },
   {
     item: "BE05",
     itensestoque: [ { tamanho: "S", qtde: 20 }, { tamanho: "M", qtde: 5 } ],
     categoria: "eletrônicos"
   }
)
```


Atualização utilizando "upsert". Ao especificar "upsert: true", o método "update()" ou atualiza os documentos que atenderem ao predicado da consulta ou insere um novo documento usando os valores especificados no update, caso não nenhum documento previamente existente atenda ao predicado de busca.
```
db.estoque.update(
   { item: "TBD1" },
   {
     item: "TBD1",
     detalhes: { "modelo" : "14Q4", "fabricante" : "ABC Empresa" },
     itensestoque: [ { "size" : "S", "qty" : 25 } ],
     categoria: "utensílios domésticos"
   },
   { upsert: true }
)
```

# EXEMPLOS DE EXCLUSÃO DE DADOS (DOCUMENTOS)

Remover os documentos que atendam a um determinado predicado:
```
db.estoque.remove( { type : "comida" } )
```

Remover um único documento que atenda a um determinado predicado:
```
db.estoque.remove( { type : "comida" }, 1 )
```

Remover todos os documentos de uma collection, Obs.: Comparando com um SGBD relacional, este comando é equivalente a um delete sem a cláusula "where":
```
db.estoque.remove({})
```

Para remover todos os documentos de uma collection, pode ser mais eficiente usar o método "drop()" para dropar a collection inteira, e então recriar a mesma e os respectivos índices.
```
db.estoque.drop();
```
# MUNICÍPIOS COM ESTADOS

```
db.municipios.aggregate([
    {
      $lookup:
        {
          from: "estados",
          localField: "codigoUf",
          foreignField: "codigo",
          as: "estado"
        }
   }
])
```

Municípios com seu estados:

```
db.municipios.aggregate([
    {
      $lookup:
        {
          from: "estados",
          localField: "codigoUf",
          foreignField: "codigo",
          as: "estado"
        }
   },
   { $project : { "nome" : 1, "codigoUf": 1, "estado.nome": 1, "estado.sigla": 1 }}
])
```