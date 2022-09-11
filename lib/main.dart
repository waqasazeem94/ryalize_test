import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ryalize_test/route_generator.dart';
import 'package:ryalize_test/ui/view/startup_view.dart';

import 'constants/app_colors.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WillIt',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: _getTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: '/Splash',
      home: const StartUpView(),
    );
  }
}

ThemeData _getTheme() {
  return ThemeData(
    // appBarTheme: AppBarTheme(
    //   systemOverlayStyle: SystemUiOverlayStyle.light, // 2
    // ),

    // checkboxTheme: CheckboxThemeData(
    //   side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(
    //       width: 1, color: AppConstants.textDullBlackColor)),
    //   fillColor: MaterialStateProperty.all(AppConstants.textYellowColor),
    //   checkColor: MaterialStateProperty.all(Colors.red),
    // ),
      textTheme: const TextTheme(
        //small grey head line on form
        headline1: TextStyle(
            color: AppColor.smallHeadLineGreyColor,
            fontSize: 18,
            fontFamily: AppColor.fontName,
            fontWeight: FontWeight.w400),
        //btn text and small green head lines style
        headline2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: AppColor.lightGreenTextColor,
          fontFamily: AppColor.fontName,
          decoration: TextDecoration.underline,
        ),
        //Text Black Bold Medium Heading style
        headline3: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.blackBoldTextMediumHeadingColor,
          fontFamily: AppColor.fontName,
        ),
        //Text field Heading text style
        headline4: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: AppColor.textFieldHeadingDullBlackColor,
          fontFamily: AppColor.fontName,
        ),
        //Text field hint text style
        headline5: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColor.textFieldHeadingDullBlackColor,
          fontFamily: AppColor.fontName,
        ),
        //Btn white text style
        headline6: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: AppColor.btnTextWhiteColor,
            fontFamily: AppColor.fontName),
        bodyText1: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: AppColor.textFieldHeadingDullBlackColor,
          fontFamily: AppColor.fontName,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: AppColor.lightGreenTextColor));
}