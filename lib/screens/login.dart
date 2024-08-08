// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:quizapp/models/details.dart';
import 'package:quizapp/models/userfunctions.dart';
import 'package:quizapp/utility/routes.dart';
import 'package:quizapp/utility/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildBackgroundContainer(
            context,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    const Text(
                      "LOGIN ",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        
                     
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Textboxfield(
                      text: 'E-mail',
                      iconName: Icons.email_outlined,
                      txtcontroller: email,
                      hidetext: false,
                      validator: _validateEmail,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Textboxfield(
                      text: 'Password',
                      iconName: Icons.remove_red_eye_outlined,
                      txtcontroller: password,
                      hidetext: true,
                      validator: _validatePassword,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    _isLoading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            onPressed: _login,
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: const Text("Login"),
                          ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.27),
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signup);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundContainer(BuildContext context, {required Widget child}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/q.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Not a valid email";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 7) {
      return "At least 7 characters";
    }
    return null;
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final mail = email.text.trim();
      final pwd = password.text.trim();

      try {
        dynamic users = await getAllDetails();
        bool isAuthenticated = false;
        for (var details in users) {
          Details user = Details.fromMap(details);
          if (user.email == mail && user.password == pwd) {
            Navigator.pushNamed(context, Routes.home, arguments: details);
            isAuthenticated = true;
            break;
          }
        }
        if (!isAuthenticated) {
          _showErrorDialog('Invalid email or password');
        }
      } catch (e) {
        _showErrorDialog('An error occurred. Please try again.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
