import 'package:flutter/material.dart';
import 'package:trivial_trivia/models/user.dart';
import 'package:trivial_trivia/services/auth.dart';

class UserProvider with ChangeNotifier{
User? _user = (const User(email: '', photoURL: '' , username: '',followers: [], following:[], id: '' ));
final Service _service = Service();

User get getUser => _user!;

Future<void> refreshUser() async {
   User? user = await _service.getUserDetails();
   _user = user;

   notifyListeners();
}
}