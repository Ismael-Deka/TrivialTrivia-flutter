import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // 'id': value.user?.uid,
  // 'username': username,
  // 'email': value.user?.email,
  // 'followers': [],
  // 'following': [],
  final String id;
  final String username;
  final String email;
  final List followers;
  final List following;
  final String photoURL;
  final int points;

  const User ({
    required this.id,
    required this.username,
    required this.email,
    required this.followers,
    required this.following,
    required this.photoURL,
    this.points = 0
  });

  Map<String, dynamic> toJason() => {
    "id": id,
    "username": username,
    "email": email,
    "followers": followers,
    "following": following,
    "photoURL" : photoURL,
    "points" : points
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      id:snapshot['id'],
      username:snapshot['username'],
      email:snapshot['email'],
      followers:snapshot['followers'],
      following:snapshot['following'],
      photoURL: snapshot['photoURL'],
      points: snapshot['points'],
    );
  }
}