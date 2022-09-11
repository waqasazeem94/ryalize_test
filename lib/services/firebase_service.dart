import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../locator.dart';
import '../utils/error_codes.dart';
import 'package:uuid/uuid.dart' as newId;

import 'local_storage_service.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  User get currentUser => _firebaseAuth.currentUser!;

  // UserModel? user;
  // ExecutorModel? executors;

  // Sign In with email and password
  Future<String?> signIn(
      String email, String password, BuildContext context) async {
    String? error;
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // throw signInErrorCodes[e.code] ?? 'Database Error Occured!';
      error = e.message;
    } catch (e) {
      error = e.toString();
      // throw '${e.toString()} Error Occured!';
    }
    Navigator.pop(context);
    return error;
  }

  // Sign Up using email address
  Future<String?> signUp(
      String name, String email, String password, BuildContext context) async {
    String? error;
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      var _user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseFirestore
          .collection('Users')
          .doc(_user.user!.uid)
          .set({
            'name': name,
            "avatar": "",
          })
          .then((value) => debugPrint('User Created : ${_user.user!.email}'))
          .catchError((e) => debugPrint('Database Error!'));
      // return _user;
    } on FirebaseAuthException catch (e) {
      error = e.message;
      // debugPrint(
      //     signUpErrorCodes[e.code] ?? 'Firebase ${e.code} Error Occured!');
    } catch (e) {
      // debugPrint('${e.toString()} Error Occured!');
      error = e.toString();
    }
    Navigator.pop(context);
    return error;
  }


// Request password change
  Future<String?> requestPass(String email) async {
    String? error;
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      error = e.message;
    }
    return error;
  }

}