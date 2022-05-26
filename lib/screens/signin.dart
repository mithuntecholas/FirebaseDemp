import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/helper/firebasehelper.dart';
import 'package:firebasedemo/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:firebasedemo/helper/firebasehelper.dart';

import '../models/user_model.dart';

final db = FirebaseFirestore.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseHelper fhelper = FirebaseHelper();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController age_controller = TextEditingController();
  TextEditingController adress_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text('TECHOLAS'),
      ),
      body:
      Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsetsDirectional.all(10),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 4)),
                      labelText: "Enter name"),
                )),
            Padding(
                padding: EdgeInsetsDirectional.all(10),
                child: TextField(
                  controller: age_controller,
                  decoration: InputDecoration(
                    labelText: "Enter age",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 4)),
                  ),
                )),
            Padding(
                padding: EdgeInsetsDirectional.all(10),
                child: TextField(
                  controller: adress_controller,
                  decoration: InputDecoration(
                    labelText: "Enter adress",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 4)),
                  ),
                )),
            ElevatedButton(
                onPressed:calladd_data,
                child: Text("ADD")),
            ElevatedButton(
                onPressed: callReadFirebase, child: Text("Get"))
          ],
        ),
      ),
    );
  }



  Future<bool> isInternetAvailable() async
  {
    try {
      final result = await InternetAddress.lookup('https://www.google.com/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
      else{
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }


  void calladd_data () async{
    fhelper.DeleteFirebaseDoc("swathi");

    // fhelper.updateFirebaseDoc(namecontroller.text,
    //     age_controller.text, adress_controller.text);
    // fhelper.add_document_firebase(namecontroller.text,
    //     age_controller.text, adress_controller.text);
    // if (await isInternetAvailable())
    //   {
    //     fhelper.add_document_firebase(namecontroller.text,
    //         age_controller.text, adress_controller.text);
    //   }


  }

   void callReadFirebase() async{
    fhelper.ReadAuser();
     //fhelper.read_FirebaseUsers();
    // if(await isInternetAvailable() )
    //   {
    //     fhelper.read_FirebaseUsers();
    //   }

  }

}
