//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final auth = FirebaseAuth.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  void registerUser(context, username, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                if (value.user != null)
                  {
                    _db.collection('users').doc(value.user?.uid).set({
                      'id': value.user?.uid,
                      'username': username,
                      'email': value.user?.email
                    }),
                    Navigator.pushNamed(context, '/main')
                  }
                else
                  {throw Error()}
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.pushNamed(context, '/main')
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

 void signOut(context) async {
    try {
      await auth.signOut().then((value) => {
            Navigator.pushNamed(context, '/starting')
          });
    } catch (e) {
      errorBox(context, e);
    }
  }
  

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }
}

