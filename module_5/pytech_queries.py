from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.vxthkcx.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
print(db.list_collection_names())

billy = {
    "first_name": "Billy",
    "last_name": "Madison",
    "student_id": "1007"
}
bobby = {
    "first_name": "Bobby",
    "last_name": "Boucher",
    "student_id": "1008"
}
happy = {
    "first_name": "Happy",
    "last_name": "Gilmore",
    "student_id": "1009"
}

billy_student_id = db.student.insert_one(billy).inserted_id
bobby_student_id = db.student.insert_one(bobby).inserted_id
happy_student_id = db.student.insert_one(happy).inserted_id
print(billy_student_id)
print(bobby_student_id)
print(happy_student_id)
