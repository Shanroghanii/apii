import 'package:apii/services/auth_api.dart';
import 'package:apii/view/auth/login_screen.dart';
import 'package:apii/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
// class SplashView extends StatelessWidget {
//
//   Future<void> initializeSettings() async {
//     String a = await AuthApi().box.read("token");
//     print("hellooo" + a);
//     await Future.delayed(const Duration(seconds: 1));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: initializeSettings(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return waitingView();
//         } else {
//           if (snapshot.hasError) {
//             return errorView(snapshot);
//           } else {
//             return const LoginScreen();
//           }
//         }
//       },
//     );
//   }
//
//   Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
//     return Scaffold(
//         body: Center(child: Text('Error: ${snapshot.error}')));
//   }
//
//   Scaffold waitingView() {
//     return Scaffold(
//         body: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: CircularProgressIndicator(),
//               ),
//               Text('Loading...'),
//             ],
//           ),
//         ));
//   }
// }

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      if(await AuthApi().box.read("token") != null){
        Get.offAll(()=> const HomeScreen());
      }else{
        Get.offAll(()=> const LoginScreen());
      }
      await Future.delayed(const Duration(seconds: 1));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
