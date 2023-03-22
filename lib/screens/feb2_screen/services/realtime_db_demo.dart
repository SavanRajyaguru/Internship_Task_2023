import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDB{
  final DatabaseReference reference = FirebaseDatabase.instance.ref();

  Future<void> insertData(String userName, String pass) async{
    try {
      // reference.child('Movies').set({
      //   "movie title": "DEMO",
      // });
      await reference.child("users/$userName").set({
        "name": userName,
        "pass": pass,
        "age": 19,
        "address": [
          {
            "line1": "ABC",
            "line2": "XYZ",
          },
          {
            "line1": "XYZ",
            "line2": "ABC",
          }
        ]
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> update(String userName) async{
    try{
      await reference.child("users/$userName").update({
        "age": 21,
        "address/0/line1": "ABC"
      });
    } on FirebaseException catch(e){
      print(e);
    }
  }

  Future<void> readData(String userName) async{
    // final snapshot = await reference.child("users/$userName").get();
    // final event = await reference.once(DatabaseEventType.value);
    final dataRef = reference.child('users/$userName/age');
    dataRef.onValue.listen((event) {
      final data = event.snapshot.value;
      print(data);
    });
    // if(snapshot.exists){
    //   print(snapshot.value);
    //   // print("AGE: ${snapshot.value}");
    // } else {
    //   print("No Data Found!!");
    // }
  }
  Future<void> deleteData(String userName) async{
    await reference.child("users/$userName/age").remove();
  }

  Future<void> getData() async{
    final ref = reference.child("count");
    print("GET>> ${ref.child('count').get()}");
    ref.onValue.listen((event) {
      final data = event.snapshot.value.toString();
      print(data);
    });
  }
}