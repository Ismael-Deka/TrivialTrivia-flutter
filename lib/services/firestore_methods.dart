import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Future<void> followUser(
    String uid,
    String followId,
  ) async{
      DocumentSnapshot snap = await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if(following.contains(followId)){
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following' : FieldValue.arrayRemove([followId])
        });
      }else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following' : FieldValue.arrayUnion([followId])
        });
      }

   
  }
  
}