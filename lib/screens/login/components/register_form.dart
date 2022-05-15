import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:weather_app/services/auth.dart';
import 'package:weather_app/store.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 30),
                  Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3767/3767036.png',
                      height: 200),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: widget.size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(50)),
                    child: TextField(
                      controller: _emailController,
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email, color: kPrimaryColor),
                          hintText: 'Email',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: widget.size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor.withAlpha(50)),
                    child: TextField(
                      controller: _passwordController,
                      cursorColor: kPrimaryColor,
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock, color: kPrimaryColor),
                          hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: Authentication(
                      context: context,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ).signUp,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: widget.size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: const Text(
                        'SIGN-UP',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
