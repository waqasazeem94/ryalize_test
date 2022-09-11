import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';
import '../models/user_model.dart';
import '../respository/auth_repository.dart';
import '../services/firebase_service.dart';
import '../services/local_storage_service.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import 'base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isHidden = true, _isLoading = false;

  // Services
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final _myRepo = AuthRepository();

  // Getters
  bool get isHidden => _isHidden;

  bool get isLoading => _isLoading;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  String? Function(String? password) get passwordValidator =>
      Validator.passwordValidator;

  String? Function(String? email) get emailValidator =>
      Validator.emailValidator;

  // Setters
  set isHidden(bool val) {
    _isHidden = val;
    notifyListeners();
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onModelReady() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void onModelDestroy() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushReplacementNamed(context, '/HomeView');

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}