import 'package:audiohub/service/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.userInputController,
    required this.labelText,
    this.obscureText = false,
    this.isemail = false,
    this.isName = false,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.password,
  });
  final bool isemail;
  final bool isPassword;
  final bool isConfirmPassword;
  final bool isName;
  final String? password;
  final TextEditingController userInputController;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userInputController,
      obscureText: obscureText,
      decoration: InputDecoration(
        // labelText: labelText,
        hintText: labelText,
        helperText: '',
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter some text';
        }
        value = value.trim();
        if (isName) {
          return Validation().nameValidation(value);
        } else if (isemail) {
          return Validation().emailValidation(value);
        } else if (isPassword) {
          return Validation().passwordValidation(value);
        } else if (isConfirmPassword) {
          return Validation().confirmPassword(value, password!);
        }
        return null;
      },
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    );
  }
}
