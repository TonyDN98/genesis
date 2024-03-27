# MongoDB BroCode

![SQL VS noSQL](image-1.png)

Lunch ``mongosh.exe``  

#### See DataBases

``show dbs``


#### use another database
``use admin``

if database dosen't exist will be created

``use school``  
``show dbs``
>Right now school collection is empty

#### Create a collection

``db.createCollection``("``students``")


#### Drop a DataBase
``db.dropDataBase()``


#### Show documents

**db.collection**.``find()``



#### insertOne / insertMany()

`use` school  
`db.createCollection("students")`  
  
`db.students.insertOne({name:"SpongeBob", age:35})`

`db.students.insertMany([{name:"Patrick", age:15},{name:"sandy", age:19},{name:"garry", age:5}])`

## DATATYPES

#### Strings

``"its a string"``  
``name : "string here"``

#### Integer
``age : 22``

#### Doubles
``gpa : 3.2``

#### booleans
``false, true
fullTime: false``

#### DateObj
``registerData : new Date()``

#### NULL
``graduateDate : null``

#### Arrays
``courses : ['Biology', "Chemestry", "calculus"]``

#### Nested Documents
``address : {street: "123 FalseSt.", city: "Bikini Botton", zip:12345}``

### Let's enter everything
```
db.students.insertOne({
    name: "Tony",
    age:25,
    gpa:3.3,
    fullTime: true,
    registerDate: new Date(),    graduated:null,
    course: ["nn", "bb"],
    address: {
        street: "Fake",
         zip:12345}})
```

#### Sort and limt

```
-- SORT
db.students.find().sort({document})
db.students.find().sort({name:1}) ASCending
db.students.find().sort({name:-1}) DESCending

-- LIMIT
db.students.find().limit(1)
db.students.find().sort({gpa:-1}).limit(1)
```


#### Find
`db.collection.find({query}, {projector})`

```
db.collection.find({key:value_1 , key:value_2}, {projector})

```
Return every row  that has a name
`db.students.find({},{name:true})`

#### Update a document
`db.students.updateOne({_id: ObjectId('65a65a30e6dd6c0d6d0f2c91')}, {$set: {fullTime: false}})`
  
`db.collection.updateOne({target}, {$set: {another_value}})`

#### Unset a value
`db.collection.updateUne({target} , {unset: {fullTime: ""}})`

` db.students.updateOne({_id: ObjectId('65a65a30e6dd6c0d6d0f2c91')}, {$unset: {fullTime:""}})`

`db.collection.updateOne({filter}, {update})`


#### $exists
``db.students.updateMany({fullTime:{$exists:false}}, {$set : {fullTime:true}})
``
**If fullTime field dose not exist $exists:false**

#### delete 
``db.collection.deleteOne({filter}, {delete})``

`db.students.deleteOne({registerDate:{$exists:true}})`

#### Comparation operators

![Alt text](image.png)

**$ne => not equal operator**
``db.students.find({name:{$ne:"Spongebob"}})``

**$lt => less then **
`` db.collection.find({age:{$lt:20}})``

**$lte -> less then or equal**

``db.collection.find({age:{$lte:15}}) ``

**$gt -> greater then**    
db.collection.find({age:{$gt:20}})

**$gte -> greater then or equal**    
db.collection.find({age:{$gte:20}})

** $and **   

`db.inventory.find( { $and: [ { price: { $ne: 1.99 } }, { price: { $exists: true } } ] } )`


$in - IN operator, match a value from an array
db.collection.find({name:{$in["Larry", "Barry"]}})

$and - AND operator
db.collection.find($and:{[fullTime:true, age:{$lt:20}]})

























