class Validation {
  String? nameValidation(String name){
    RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
    if(name.isEmpty){
      return 'Name cannot be empty';
    }else if(!nameRegExp.hasMatch(name)){
      return 'Name can only contain alphabets';
    }
    return null;
  }

  String? emailValidation(String email){
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
    if(email.isEmpty){
      return 'Email cannot be empty';
  }else if(!emailRegExp.hasMatch(email)){
      return 'Enter a valid email';
    }
    return null;
  }

  String? passwordValidation( String password){
    if  (password.isEmpty){
      return 'Password cannot be empty';
  }else if(password.length<6){
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
  String? confirmPassword(String password, String confirmPassword){
    if(confirmPassword.isEmpty){
      return 'Confirm Password cannot be empty';
    }else if(password!=confirmPassword){
      return 'Password does not match';
    }
    return null;

  }
}