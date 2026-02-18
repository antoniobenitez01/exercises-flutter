import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethod {
  Future addStudent(Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
      .collection("Students")
      .doc(id)
      .set(studentInfoMap);
  }

  Future<Stream<QuerySnapshot>> getStudentDetails() async {
    return await FirebaseFirestore.instance.collection("Students").snapshots();
  }

  updateAttendance(String attendanceCase, String id) async {
    return await FirebaseFirestore.instance.collection("Students").doc(id).update({
      attendanceCase : true
    });
  }

  deleteStudent(String id) async {
    return await FirebaseFirestore.instance.collection("Students").doc(id).delete();
  }
}