import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textform_field.dart';
import 'base_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late final LoginViewModel _model;
  late final BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        _model = model;
        _context = context;
        model.onModelReady();
      },
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: _model.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 35, right: 35),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Center(
                                  child: Text("Welcome to Ryalize",
                                      style: headingStyle)),
                              const SizedBox(height: 30),
                              Text("Please add your information",
                                  style: Theme.of(context).textTheme.headline3),
                              const SizedBox(height: 20),
                              Text("Enter email",
                                  style: Theme.of(context).textTheme.headline5),
                              const SizedBox(height: 5),
                              CustomTextFormField(
                                  controller: _model.emailController,
                                  labelText: "johndoe@mail.com",
                                  hint: "Enter Email",
                                  validator: _model.emailValidator),
                              const SizedBox(height: 20),
                              Text("Password",
                                  style: Theme.of(context).textTheme.headline5),
                              const SizedBox(height: 5),
                              CustomTextFormField(
                                controller: _model.passwordController,
                                labelText: "*********",
                                hint: "Enter Password",
                                obscureText: _model.isHidden,
                                validator: _model.passwordValidator,
                                suffixIcon: IconButton(
                                  icon: _model.isHidden
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    _model.isHidden = !_model.isHidden;
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/RegisterView'),
                                child: const Text(
                                    "Don't have an account? Signup",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppColor.lightGreenTextColor)),
                              ),
                              const SizedBox(height: 30),
                              Center(
                                  child: CustomButton(
                                name: "Login",
                                btnHeight: 50,
                                btnWidth: 200,
                                color: AppColor.btnColor,
                                onTap: () async {
                                  final isValid =
                                      _formKey.currentState!.validate();
                                  if (!isValid) return;
                                  Map data = {
                                    'email': _model.emailController.text
                                        .trim()
                                        .toString(),
                                    'password': _model.passwordController.text
                                        .trim()
                                        .toString(),
                                  };

                                  _model.loginApi(data, context);
                                },
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}