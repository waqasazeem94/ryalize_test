import 'package:flutter/material.dart';
import 'package:ryalize_test/ui/view/home_view.dart';
import 'package:ryalize_test/ui/view/login_view.dart';
import 'package:ryalize_test/ui/view/register_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/LoginView':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/RegisterView':
        return MaterialPageRoute(builder: (_) => RegisterView());
      case '/HomeView':
        return MaterialPageRoute(builder: (_) => HomeView());

      // case '/CodeVerification':
      //   return MaterialPageRoute(builder: (_) {
      //     UserModel? argument = args as UserModel?;
      //     return CodeVerification(user: argument!);
      //   });
      // case '/CustomBottomNavigationBar':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return CustomBottomNavigationBar(
      //       bottomNavIndex: arg[0],
      //     );
      //   });
      // case '/ProfilePage':
      //   return MaterialPageRoute(builder: (_) => const ProfilePage());
      // case '/ProfileLink':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return ProfileLink(
      //       usersData: arg[0],
      //       userIndex: arg[1],
      //     );
      //   });
      // case '/RequestedUserProfile':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return RequestedUserProfile(
      //       usersData: arg[0],
      //       userIndex: arg[1],
      //       getSendLinkRequestData: arg[2],
      //     );
      //   });
      // case '/SendRequestPage':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return SendRequestPage(
      //       usersData: arg[0],
      //       userIndex: arg[1],
      //     );
      //   });
      // case '/SentRequestPage':
      //   return MaterialPageRoute(builder: (_) => const SentRequestPage());
      // case '/SentRequestProfile':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return SentRequestProfile(
      //       userData: arg[0],
      //       userIndex: arg[1],
      //       myRequests: arg[2],
      //       myLinks: arg[3],
      //     );
      //   });
      // case '/ReceivedRequestProfilePage':
      //   return MaterialPageRoute(builder: (_) {
      //     List<dynamic> arg = args as List<dynamic>;
      //     return ReceivedRequestProfilePage(
      //       userData: arg[0],
      //       userIndex: arg[1],
      //       myRequests: arg[2],
      //       myLinks: arg[3],
      //     );
      //   });
      // case '/ReceivedRequestPage':
      //   return MaterialPageRoute(builder: (_) => const ReceivedRequestPage());
      // case '/AccountPage':
      //   return MaterialPageRoute(builder: (_) {
      //     return const AccountPage();
      //   });
      // case '/HelpQuestionPage':
      //   return MaterialPageRoute(builder: (_) => const HelpQuestionPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}