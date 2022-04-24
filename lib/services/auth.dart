//import 'dart:html';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivial_trivia/models/user.dart' as model;
import 'package:trivial_trivia/services/storage_methods.dart';

class Service {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
  
    return model.User.fromSnap(snap);
  }

  Future<String> registerUser(
    context, {
    required String email,
    required String username,
    required String password,
    required Uint8List file,
  }) async {
    String res = "Error";
    try {
      if (username.isNotEmpty || email.isNotEmpty || password.isNotEmpty
      || file != null
      ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoURL = await StorageMethods().uploadImageToStorage('profilePics', file);

        model.User user = model.User(
          id: cred.user!.uid,
          username: username,
          email: email,
          followers: [],
          following: [],
          photoURL: photoURL,
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJason());
        res = "Success";
        Navigator.pushNamed(context, '/main');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
    context, {
    required String email,
    required String password,
  }) async {
    String res = "Error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => {Navigator.pushNamed(context, '/main')});
        res = "Success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

 Future<String> updateUserProfile(
    context, {
    required String username,
    required Uint8List? profilePic,
  }) async {
    User currentUser = _auth.currentUser!;
    String res = "Error";
    try {
      if (username.isNotEmpty || profilePic!.isEmpty) {
        await _firestore
            .collection('users').doc(currentUser.uid).update({'username': username})
            .then((value) => {Navigator.pushNamed(context, '/profile')});
        res = "Success";
      }
      if (username.isEmpty || profilePic!.isNotEmpty){
        String photoURL = await StorageMethods().uploadImageToStorage('profilePics', profilePic!);
        await _firestore
            .collection('users').doc(currentUser.uid).update({'photoURL': photoURL})
            .then((value) => {Navigator.pushNamed(context, '/profile')});
        res = "Success";
        
      }
      if (username.isNotEmpty || profilePic.isNotEmpty){
        String photoURL = await StorageMethods().uploadImageToStorage('profilePics', profilePic);
        await _firestore
            .collection('users').doc(currentUser.uid).update({'photoURL': photoURL})
            .then((value) => {Navigator.pushNamed(context, '/profile')});
        await _firestore
            .collection('users').doc(currentUser.uid).update({'username': username})
            .then((value) => {Navigator.pushNamed(context, '/profile')});
        res = "Success";
        
      }
      else{
        res = "Please enter something to update";
      }
      
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  void signOut(context) async {
    try {
      await _auth
          .signOut()
          .then((value) => {Navigator.pushNamed(context, '/starting')});
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
