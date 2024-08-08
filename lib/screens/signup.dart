// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/models/details.dart';
import 'package:quizapp/models/userfunctions.dart';
import 'package:quizapp/utility/routes.dart';
import 'package:quizapp/utility/text.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                       
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Textboxfield(
                      text: 'Name',
                      iconName: Icons.person_outline,
                      txtcontroller: name,
                      hidetext: false,
                      validator: _validateName,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Textboxfield(
                      text: 'Age',
                      iconName: Icons.calendar_today_outlined,
                      txtcontroller: age,
                      hidetext: false,
                      validator: _validateAge,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                    _isLoading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            onPressed: _register,
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: const Text("Register"),
                          ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text(
                      "Already a member?",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: const Text(
                        "Login",
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

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    } else if (int.tryParse(value) == null) {
      return 'Please enter a valid age';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 5) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String name_ = name.text.trim();
      String age_ = age.text.trim();
      String email_ = email.text.trim();
      String password_ = password.text.trim();

      Details details = Details(
        name: name_,
        age: int.parse(age_),
        email: email_,
        password: password_,
      );

      try {
        await addDetails(details);
        Navigator.pushNamed(context, Routes.login);
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
