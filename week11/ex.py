from pymongo import MongoClient
from datetime import date, datetime

client = MongoClient("mongodb://localhost")
db = client['test']

# 1.1
for rest in db.restaurants.find({'cuisine' : 'Indian'}):
    print(rest)

## 1.2
for rest in db.restaurants.find({"$or": [ {'cuisine' : 'Indian', 'cuisine' : 'Thai' } ] }):
    print(rest)

# 1.3
for rest in db.restaurants.find({
    "address.building" : '1115',
    'address.street' : 'Rogers Avenue',
    'address.zipcode' : '11226' } ):
    print(rest)

def ex2():
    row = db.restaurants.insert_one({
        'address': {
            'building': '1480',
            'street': '2 Avenue',
            'zipcode': '10075',
            'coord': [-73.9557413, 40.7720266]
        },
        'borough': 'Manhattan',
        'cuisine': 'Italian',
        'grades': [{'date': datetime(2014, 10, 1), 'grade': 'A', 'score': 11}],
        'restaurant_id': '41704620'
    })

    print(list(db.restaurants.find({'_id': row.inserted_id})))
ex2()

# 3.1
db.restaurants.delete_one({
    'borough': 'Manhattan'
})
# 3.2
db.restaurants.delete_many({
    'cuisine': 'Thai'
})

# Gives []
print(list(db.restaurants.find({'cuisine': 'Thai'})))

# 4
to_delete = []
to_add = []
for doc in db.restaurants.find({'address.street': 'Rogers Avenue'}):
    count = 0
    for grade in doc['grades']:
        if grade['grade'] == 'C':
            count += 1

    if count > 1:
        to_delete.append(doc['_id'])
    else:
        to_add.append(doc['_id'])

for id_ in to_delete:
    db.restaurants.delete_one({'_id': id_})

for id_ in to_add:
    db.restaurants.update_one({'_id': id_}, {'$push': {'grades' : { 'grade': 'C'}}})
