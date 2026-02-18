import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio9/service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget{
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent>{

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController rollcontroller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: .only(top:60, left:20, right: 20),
        child: Column(
          crossAxisAlignment: .start,
          children:[
            Row(
              mainAxisAlignment: .start,
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width:50),
                Text("Add ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: .bold 
                )),
                Text("Student", style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: .bold 
                )),
              ]
            ),
            SizedBox(height:30),
            Text("Student Name ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .bold 
            )),
            SizedBox(height:10 ),
            Container(
              padding: .only(left:20),
              decoration: BoxDecoration(
                color: Color(0xFFececf0),
                borderRadius: .circular(10)
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: .none,
                  hintText: "Enter Student Name"
                ),
              )
            ),
            SizedBox(height:20),
            Text("Student Age ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .bold 
            )),
            SizedBox(height:10 ),
            Container(
              padding: .only(left:20),
              decoration: BoxDecoration(
                color: Color(0xFFececf0),
                borderRadius: .circular(10)
              ),
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(
                  border: .none,
                  hintText: "Enter Student Age"
                ),
              )
            ),
            SizedBox(height:30),
            Text("Student Roll No. ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: .bold 
            )),
            SizedBox(height:10 ),
            Container(
              padding: .only(left:20),
              decoration: BoxDecoration(
                color: Color(0xFFececf0),
                borderRadius: .circular(10)
              ),
              child: TextField(
                controller: rollcontroller,
                decoration: InputDecoration(
                  border: .none,
                  hintText: "Enter Student Roll No."
                ),
              )
            ),
            SizedBox(height:50),
            GestureDetector(
              onTap: () async {
                if(namecontroller.text!="" && agecontroller.text!="" && rollcontroller.text!=""){
                  String addID = randomAlphaNumeric(10);
                  Map<String, dynamic> studentInfoMap = {
                    "Name" : namecontroller.text,
                    "Age" : agecontroller.text,
                    "RollNo" : rollcontroller.text,
                    "Absent" : false,
                    "Present" : false
                  };
                  await DatabaseMethod().addStudent(studentInfoMap, addID).then((value) {
                    namecontroller.text="";
                    agecontroller.text="";
                    rollcontroller.text="";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Student Data Uploaded"),
                        backgroundColor: Colors.green,
                      ));
                  });
                }
              },
              child: Center(
                child: Container(
                  padding: .symmetric(vertical: 8),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: .circular(10) 
                  ),
                  child: Center(
                    child: Text("Add", style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: .bold 
                    )),
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}