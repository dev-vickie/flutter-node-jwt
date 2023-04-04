import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiProcessing = false;
  bool hidePassword = true;
  String? username;
  String? password;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: ProgressHUD(
            key: UniqueKey(),
            inAsyncCall: isApiProcessing,
            child: Form(
              key: globalFormKey,
              child: buildRegister(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRegister(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormHelper.inputFieldWidget(
            context,
            "username",
            "Username",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "Username can't be empty";
              }
              return null;
            },
            (onSavedValue) {
              username = onSavedValue;
            },
            prefixIcon: const Icon(Icons.person),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
          const SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            "email",
            "Email",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "Email can't be empty";
              }
              return null;
            },
            (onSavedValue) {
              username = onSavedValue;
            },
            prefixIcon: const Icon(Icons.person),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
          const SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            "password",
            "Password",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "Password can't be empty";
              }
              return null;
            },
            (onSavedValue) {
              password = onSavedValue;
            },
            prefixIcon: const Icon(Icons.person),
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            textColor: Colors.white,
            borderColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 20),
          FormHelper.submitButton(
            "Register",
            () {},
            btnColor: Colors.blue[900]!,
            borderColor: Colors.white,
            txtColor: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
