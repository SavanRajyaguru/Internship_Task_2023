import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDB{
  final DatabaseReference reference = FirebaseDatabase.instance.ref();

  Future<void> insertData() async{
    print(">>>>>s");
    try {
      print("????????");
      reference.child('Movies').push().set({
        "movie title": "DEMO",
      });
      // await reference.child("users").push().set({
      //   "name": "DEMO",
      //   "pass": "DEMO PASS",
      //   "address": {
      //     "line1": "test test",
      //     "line2": "demo demo"
      //   }
      // });
    } on FirebaseException catch (e) {
      print(e);
    }
    print("????e");
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