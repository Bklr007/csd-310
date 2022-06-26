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

from pymongo import MongoClient 
url = "mongodb+srv://admin:admin@cluster0.vxthkcx.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(url)
db = client_pytech
students = db.students
student_list = students.find({})

# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

# loop over the collection and output the results 
for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

# update student_id 1007
result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Oakenshield II"}})

# find the updated student document 
thorin = students.find_one({"student_id": "1007"})

# display message
print("\n  -- DISPLAYING STUDENT DOCUMENT 1007 --")

# output the updated document to the terminal window
print("  Student ID: " + thorin["student_id"] + "\n  First Name: " + thorin["first_name"] + "\n  Last Name: " + thorin["last_name"] + "\n")

# exit message 
input("\n\n  End of program, press any key to continue...")

