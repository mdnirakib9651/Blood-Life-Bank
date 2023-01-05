import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_bank/FireBase%20FireStore%20DataBase/response.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firebaseFirestore.collection('signup');

class FirebaseCrud {

  // ........................ Loging Number ......................
  //............Create..............
  static Future<Loging_Response> Loging_CRUD({required String LogNumber}) async {

    Loging_Response loging_response = Loging_Response();
    DocumentReference documentReference = _collectionReference.doc();

    Map<String, dynamic> logingData = <String, dynamic>{
      "Loging_Number" : LogNumber,
    };

    await documentReference.set(logingData).whenComplete((){
      loging_response.code = 200;
    }).catchError((error){
      loging_response.code = 500;
    });
    return loging_response;
  }
  //.......Read Loging..........
  static Stream<QuerySnapshot> Loging_read(){
    CollectionReference notesItemCollection = _collectionReference;
    return notesItemCollection.snapshots();
  }





  //.................. SingUp CRUD.......................
  static Future<SingUp_Response> SingUp_CRUD({
    required String name,
    required String phone,
    required String email,
    required String birthdate,
  }) async {

    SingUp_Response singUp_Response = SingUp_Response();
    DocumentReference documentReference = _collectionReference.doc();

    Map<String, dynamic> singupData = <String, dynamic>{
      "SingUp_name" : name,
      "SingUp_phone" : phone,
      "SingUp_email" : email,
      "SingUp_birthdate" : birthdate,
    };

    await documentReference.set(singupData).whenComplete((){
      singUp_Response.code = 200;
      singUp_Response.message = "Successfully Add to the Database";
    }).catchError((error){
      singUp_Response.code = 500;
      singUp_Response.message = error;
    });
    return singUp_Response;
  }

  static Stream<QuerySnapshot> SingUp_read(){
    CollectionReference notesItemCollection = _collectionReference;
    return notesItemCollection.snapshots();
  }
}
