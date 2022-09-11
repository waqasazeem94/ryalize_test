import 'package:flutter/material.dart';

import '../../viewmodel/startup_viewmodel.dart';
import 'base_view.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      builder: (context, model, child) => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      onModelReady: (model) {
        model.onModelReady().then((value) => Navigator.pushReplacementNamed(
                context, value ? '/LoginView' : '/LoginView')
            //     Navigator.of(context).pushReplacementNamed(
            //   value ? HomeView.id : LoginView.id,
            // ),
            );
      },
    );
  }
}