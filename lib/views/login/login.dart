
import 'package:audiohub/service/firebase/authentication.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/signup/signup.dart';
import 'package:audiohub/views/signup/signup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_button/sign_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginInputEmail = TextEditingController();

  TextEditingController loginInputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Lottie.asset(
                    'assets/lotties/SignIn.json',
                  ),
                ),
                const Spacer(),
                const TextWidget(text: 'Email'),
                const Spacer(),
                TextFieldWidget(userInputController: loginInputEmail, labelText: 'Email'),
                const TextWidget(text: 'Password'),
                const Spacer(),
                TextFieldWidget(
                  userInputController: loginInputPassword,
                  labelText: 'Password',
                  obscureText: true,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    )),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (loginInputEmail.text.trim().isEmpty ||
                            loginInputPassword.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill all the fields')));
                          // toastMessage(message: 'Please fill all the fields');
                        } else {
                          Auth(context: context).signinwithemail(
                              email: loginInputEmail.text.trim(),
                              password: loginInputPassword.text.trim());
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kheight * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: SignInButton(
                      buttonType: ButtonType.google,
                      onPressed: () {
                        Auth(context: context).signwithgoogle();
                      }),
                ),
                Expanded(
                  flex: 25,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have account?',
                          style: TextStyle(color: Colors.black),
                          textScaleFactor: 1.3,
                        ),
                        Spacer(),
                        Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                          textScaleFactor: 1.3,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
