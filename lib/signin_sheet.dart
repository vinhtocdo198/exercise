import 'package:flutter/material.dart';
import 'signup_sheet.dart';

class SignInSheet extends StatelessWidget {
  const SignInSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInForm();
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _gmailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  bool _obscurePass = true; // Hide password
  bool _containsAtSymbol = false; // Contains @ or not

  @override
  void dispose() {
    _gmailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // Sign in successful
  void _signIn() {
    Navigator.of(context).pushNamed('/success');
  }

  // Go to sign up screen
  void showSignUpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
        child: SignUpSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

            // Gmail
            TextFormField(
              controller: _gmailCtrl,
              onChanged: (value) {
                setState(() {
                  _containsAtSymbol = _gmailCtrl.text.contains('@');
                });
              },
              decoration: InputDecoration(
                label: const Text('Gmail',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
                suffixIcon: Icon(_containsAtSymbol ? Icons.check : null),
              ),
              validator: (value) =>
                  _gmailCtrl.text.isNotEmpty || _gmailCtrl.text.contains('@')
                      ? null
                      : 'Invalid gmail!',
            ),

            const SizedBox(
              height: 20,
            ),

            // Password
            TextFormField(
              controller: _passCtrl,
              obscureText: _obscurePass,
              decoration: InputDecoration(
                label: const Text('Password',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePass = !_obscurePass;
                    });
                  },
                  icon: Icon(
                    _obscurePass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) =>
                  _passCtrl.text.isEmpty ? 'Invalid password!' : null,
            ),

            const SizedBox(
              height: 20,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                // Sign in button
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
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
                      if (_formKey.currentState!.validate()) {
                        _signIn();
                      }
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

                const SizedBox(
                  height: 130,
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Don\'t have account?',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showSignUpBottomSheet(context);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
