import 'package:flutter/material.dart';
import 'signin_sheet.dart';

class SignUpSheet extends StatelessWidget {
  const SignUpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpForm();
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _phoneGmailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  final TextEditingController _cfPassCtrl = TextEditingController();

  bool _emptyName = true;
  bool _validPhoneEmail = false; // Contains @ or only numbers
  bool _obscurePass = true; // Hide password
  bool _obscureCfPass = true; // Hide password

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneGmailCtrl.dispose();
    _passCtrl.dispose();
    _cfPassCtrl.dispose();
    super.dispose();
  }

  // Sign in successful
  void _signUp() {
    Navigator.of(context).pushNamed('/success');
  }

  // Go to sign in screen
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

            // Full Name
            TextFormField(
              controller: _nameCtrl,
              onChanged: (value) {
                setState(() {
                  _emptyName = _nameCtrl.text.isEmpty;
                });
              },
              decoration: InputDecoration(
                label: const Text('Full Name',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
                suffixIcon: Icon(_emptyName ? null : Icons.check),
              ),
              validator: (value) => _emptyName ? 'Invalid name!' : null,
            ),

            // Phone or Gmail
            TextFormField(
              controller: _phoneGmailCtrl,
              onChanged: (value) {
                setState(() {
                  _validPhoneEmail = _phoneGmailCtrl.text.contains('@') ||
                      RegExp(r'^[0-9]+$').hasMatch(_phoneGmailCtrl.text);
                });
              },
              decoration: InputDecoration(
                label: const Text('Phone or Gmail',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
                suffixIcon: Icon(_validPhoneEmail ? Icons.check : null),
              ),
              validator: (value) =>
                  _phoneGmailCtrl.text.isNotEmpty || _validPhoneEmail
                      ? null
                      : 'Invalid phone or gmail!',
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

            // Confirm Password
            TextFormField(
              controller: _cfPassCtrl,
              obscureText: _obscureCfPass,
              decoration: InputDecoration(
                label: const Text('Confirm Password',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureCfPass = !_obscureCfPass;
                    });
                  },
                  icon: Icon(
                    _obscureCfPass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) =>
                  _cfPassCtrl.text.isEmpty || _passCtrl.text != _cfPassCtrl.text
                      ? 'Password does not match!'
                      : null,
            ),

            const SizedBox(
              height: 30,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20.0,
                ),

                // Sign up button
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
                        _signUp();
                      }
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 80,
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Already have account?',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showSignInBottomSheet(context);
                    },
                    child: const Text(
                      'Sign In',
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
