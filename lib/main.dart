import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';
import 'signin_sheet.dart';
import 'signup_sheet.dart';
import 'success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 204, 52, 52),
                Color.fromARGB(255, 115, 26, 26),
                Color.fromARGB(255, 55, 0, 58),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 204, 52, 52),
              Color.fromARGB(255, 115, 26, 26),
              Color.fromARGB(255, 55, 0, 58),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fitness icon
            Transform.rotate(
              angle: 135 * 3.1415926535 / 180,
              child: const Icon(
                Icons.fitness_center,
                color: Colors.white,
                size: 60,
              ),
            ),

            const Text(
              'FITNESS CLUB',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const LogInOptions(), // 2 buttons

            const SizedBox(
              height: 150.0,
            ),
            const Text(
              'Login with Social Media',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignInButton(
                  button: Button.Instagram,
                  mini: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                SignInButton(
                  button: Button.Twitter,
                  mini: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                SignInButton(
                  button: Button.Facebook,
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LogInOptions extends StatefulWidget {
  const LogInOptions({
    super.key,
  });

  @override
  State<LogInOptions> createState() => _LogInOptionsState();
}

class _LogInOptionsState extends State<LogInOptions> {
  void showSignUpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
        child: SignUpSheet(),
      ),
    );
  }

  void showSignInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
        child: SignInSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          // Sign in button
          Container(
            width: double.infinity,
            height: 55,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 1.5)),
              // todo: add white border
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 204, 52, 52),
                  Color.fromARGB(255, 115, 26, 26),
                  Color.fromARGB(255, 55, 0, 58),
                ],
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                showSignInBottomSheet(context);
              },
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Sign up button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                showSignUpBottomSheet(context);
              },
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
