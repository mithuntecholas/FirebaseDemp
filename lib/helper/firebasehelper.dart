import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirebaseHelper
{
  static final FirebaseHelper _instance = FirebaseHelper._internal();

  factory FirebaseHelper () => _instance;

  FirebaseHelper._internal();

  Future add_document_firebase(name,age,adress) async {
    final doc=FirebaseFirestore.instance.collection("users").doc(name);
    final json={
      "name":name,
      "age":int.parse(age),
      "adress":adress

    };
    doc.set(json);
  }
  void read_FirebaseUsers() async {
    var data=FirebaseFirestore.instance.collection("employees");
    data.get().then((QuerySnapshot documents)
    {
      final d=documents.size;
      List<QueryDocumentSnapshot> doc_list=documents.docs;

      if(doc_list.isNotEmpty)
        {
          List<Employee> emp_lists=[];
          for(QueryDocumentSnapshot doc in doc_list )
          {
            var document=doc.data();
            Employee emp=Employee.frommapto(doc.data());
            emp_lists.add( emp);
            print("emp name---> ${emp.name}");
            print("documents-->$document");
          }
          print("number of docs $d");
        }


        });




  }


  void ReadAuser() async {
    var doc_reference=FirebaseFirestore.instance.collection("users").doc("swathi");



    doc_reference.get().then((DocumentSnapshot document)
    {
      if(document.exists)
        {
          var json= document.data();
          Employee emp=Employee.frommapto(json);

          print("emp name---> ${emp.name}");
        }else{
        print("no document exist");
      }

    });

  }



  Future updateFirebaseDoc(name,age,adress) async {
    final doc = FirebaseFirestore.instance.collection("users").doc("swathi");
    doc.get().then((DocumentSnapshot document) {

      if(document.exists)
        {
          final json = {
            "name": name,
            "age": int.parse(age),
            "adress": adress
          };
          doc.update(json);

        }

    });


  }
  Future DeleteFirebaseDoc(id) async {
    final doc = FirebaseFirestore.instance.collection("users").doc("swathi");
    doc.delete();
  }



}