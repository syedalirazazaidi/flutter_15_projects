import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:notice_board/constants/error.dart';

abstract class AuthBase {
  Future<void> createUser(String email, String password);
  Future<void> login(String email, String password);
  Future<void> signOut();
  User? get currentUser;
}

class AuthService extends AuthBase {
  static final AuthService instance = AuthService._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService._internal() {}

  factory AuthService() {
    return instance;
  }
  @override
  Future<User?> createUser(String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        throw Exception(ErrorString.userCreationFailed);
      }
      return response.user;
    } catch (e) {
      debugPrint('${ErrorString.userCreationFailed}$e');
      rethrow;
    }
  }


  @override
  User? get currentUser => _auth.currentUser;


  @override
  Future<User?> login(String email, String password) async {
    print('${_auth.currentUser} --++++++++++++++++++++---------');

    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (response.user == null) {
        throw Exception(ErrorString.loginFailed);
      }
      return response.user;
    } catch (e) {
      debugPrint('${ErrorString.loginFailed}$e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
