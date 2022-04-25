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
          .signInWithEmailAndPassword(email: email.trim(), password: password)
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

  void addPoints(context, int points) async {
    try {
      await _db.collection('users').doc(auth.currentUser!.uid).update({'points':points});
    } catch (e) {
      errorBox(context, e);
    }
  }

 Future<int> getPoints(context) async{
      try {
        DocumentSnapshot d = await _db.collection('users')
            .doc(auth.currentUser!.uid)
            .get();
        return d.get("points");
      }catch (e) {
        errorBox(context, e);
        return 0;
      }
  }

  Future<List<List<String>>> getLeaderboard() async{
    List<List<String>> playerList = List.empty(growable: true);
    await _db.collection('users').orderBy('points',descending: false).get().then((QuerySnapshot q) {
      for (var d in q.docs) {
        playerList.add([d.get("username"),d.get("points").toString(),d.get("photoURL")]);
      }
    });
    return playerList;
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

