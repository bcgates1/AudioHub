import 'package:audiohub/service/firebase/authentication.dart';
import 'package:audiohub/views/signup/signup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController signupInputName = TextEditingController();

  TextEditingController signupInputEmail = TextEditingController();

  TextEditingController signupInputPassword = TextEditingController();

  TextEditingController signupInputPasswordConfirm = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                'Create a new account',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Expanded(
                flex: 8,
                child: Lottie.asset(
                  'assets/lotties/SignUp.json',
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: 'Name',
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        userInputController: signupInputName,
                        labelText: 'Enter your name',
                        isName: true,
                      ),
                      const TextWidget(
                        text: 'Email',
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        userInputController: signupInputEmail,
                        labelText: 'Enter your Email',
                        isemail: true,
                      ),
                      const TextWidget(
                        text: 'Password',
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                          userInputController: signupInputPassword,
                          labelText: 'Enter your Password',
                          isPassword: true,
                          obscureText: true),
                      const TextWidget(
                        text: 'Confirm Password',
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                          userInputController: signupInputPasswordConfirm,
                          labelText: 'Renter your Password',
                          password: signupInputPassword.text.trim(),
                          isConfirmPassword: true,
                          obscureText: true),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Auth(context: context).signupwithemailid(
                            email: signupInputEmail.text,
                            password: signupInputPassword.text,
                            username: signupInputName.text,
                          );
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black),
                      textScaleFactor: 1.3,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.orange,
                        decoration: TextDecoration.underline,
                      ),
                      textScaleFactor: 1.3,
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
