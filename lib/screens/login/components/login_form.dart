import 'package:flutter/material.dart';
import 'package:weather_app/services/auth.dart';
import 'package:weather_app/store.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Image.network(
                    'https://cdn-icons-png.flaticon.com/512/4052/4052984.png',
                    height: 200),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: widget.size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor.withAlpha(50)),
                  child: TextField(
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.mail, color: kPrimaryColor),
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwController,
                    cursorColor: kPrimaryColor,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock, color: kPrimaryColor),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: Authentication(
                    context: context,
                    email: _emailController.text,
                    password: _passwController.text,
                  ).logIn,
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
                      'LOGIN',
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
    );
  }
}
