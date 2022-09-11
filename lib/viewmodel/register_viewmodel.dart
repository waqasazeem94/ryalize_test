import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../respository/auth_repository.dart';
import '../utils/utils.dart';
import '../utils/validators.dart';
import 'base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isHidden = true, _isLoading = false;

  final _myRepo = AuthRepository();

  // Getters
  bool get isHidden => _isHidden;

  bool get isLoading => _isLoading;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  String? Function(String? name) get nameValidator => Validator.nameValidator;

  String? Function(String? email) get emailValidator =>
      Validator.emailValidator;

  String? Function(String? password) get passwordValidator =>
      Validator.passwordValidator;

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

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.signUpApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
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