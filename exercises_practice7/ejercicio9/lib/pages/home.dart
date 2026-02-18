import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio9/pages/add_student.dart';
import 'package:ejercicio9/service/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  getontheload() async {
    studentStream = await DatabaseMethod().getStudentDetails();
    setState(() {
      
    });
  }

  Stream? studentStream;

  Widget showStudentsList(){
    return StreamBuilder(stream: studentStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData ? ListView.builder(
        padding: .zero,
        shrinkWrap: true,
        scrollDirection: .vertical,
        itemCount: snapshot.data.docs.length, 
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot ds = snapshot.data.docs[index];
          return Container(
            margin: .only(bottom:20),
            child: Material(
                elevation: 3,
                borderRadius: .circular(10),
                child: Container(
                  padding: .only(left: 20, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .circular(10)
                  ), 
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          Text("Student Name : ", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: .w500 
                          )),
                          Text(ds["Name"], style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: .w500 
                          )),
                          Spacer(),
                          GestureDetector(
                            onTap: () async {
                              await DatabaseMethod().deleteStudent(ds.id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right:25, top:10),
                              child: Icon(Icons.delete, color: Colors.black, size: 30),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: [
                          Text("Roll No. : ", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: .w500 
                          )),
                          Text(ds["RollNo"], style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: .w500 
                          )),
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: [
                          Text("Age : ", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: .w500 
                          )),
                          Text(ds["Age"], style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: .w500 
                          )),
                        ],
                      ),
                      SizedBox(height:5),
                      Row(
                        children: [
                          Text("Attendance : ", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: .bold 
                          )),
                          SizedBox(width:10),
                          ds["Present"] == false ? GestureDetector(
                            onTap: () async {
                              await DatabaseMethod().updateAttendance("Present", ds.id);
                            },
                            child: Container(
                              width: 50,
                              padding: .all(5),
                              decoration: BoxDecoration(
                                border : .all(),
                                borderRadius: .circular(5)
                              ),
                              child: Center(
                                child: Text("P", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: .bold 
                                                        )),
                              ),
                            ),
                          ): Container(
                            width: 50,
                            padding: .all(5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: .circular(5)
                            ),
                            child: Center(
                              child: Text("P", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: .bold 
                                                      )),
                            ),
                          ),
                          SizedBox(width:20),
                          ds["Absent"] == false ? GestureDetector(
                            onTap: () async {
                              await DatabaseMethod().updateAttendance("Absent", ds.id);
                            },
                            child: Container(
                              width: 50,
                              padding: .all(5),
                              decoration: BoxDecoration(
                                border: .all(),
                                borderRadius: .circular(5)
                              ),
                              child: Center(
                                child: Text("A", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: .bold)),
                              ),
                            ),
                          ) : Container(
                            width: 50,
                            padding: .all(5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: .circular(5)
                            ),
                            child: Center(
                              child: Text("A", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: .bold)),
                            ),
                          )
                        ],
                      ),
                    ]
                  )
                ),
              ),
          );
        },
      ): Container();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent()));
        },
        child: Icon(Icons.add, color: Colors.white)
      ),
      body : Container(
        margin: .only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("Student ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: .bold 
                )),
                Text("Attendance", style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: .bold 
                )),
              ]
            ),
            SizedBox(height:30),
            showStudentsList()
          ]
        )
      )
    );
  }
}
