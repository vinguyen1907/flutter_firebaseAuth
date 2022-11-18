import 'package:flutter/material.dart';
import 'package:test_firebase/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      width: size.width,
      color: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          button(
              icon: Image.asset('assets/images/google.png'),
              title: 'Sign in with Google',
              size: size,
              onTap: () {}),
          button(
              icon: Image.asset('assets/images/telephone-call.png'),
              title: 'Sign in with Google',
              size: size,
              onTap: () {}),
          const Text("Or",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
          const SizedBox(height: 16),
          inputField(
              placeholder: "Enter email",
              size: size,
              controller: _emailController,
              obscureText: false),
          const SizedBox(height: 16),
          inputField(
              placeholder: "Enter password",
              size: size,
              controller: _passwordController,
              obscureText: true),
          InkWell(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });

                try {
                  firebase_auth.UserCredential userCredential =
                      await firebaseAuth.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                  setState(() {
                    _isLoading = false;
                  });
                  print("Sign in success");
                } catch (e) {
                  final snackBar = SnackBar(
                    content: Text(e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                height: size.height / 15,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              )),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("If you don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              const SizedBox(width: 8),
              InkWell(
                  child: const Text("Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpPage()),
                        (route) => false);
                  }),
            ],
          ),
          InkWell(
              child: const Text("Forgot password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {}),
        ],
      ),
    ));
  }

  Widget button(
      {Widget? icon,
      required String title,
      required Size size,
      Function? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
          onTap: () {},
          child: Container(
            height: size.height / 15,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 16),
                    height: 25,
                    width: 25,
                    child: icon != null ? icon : Container()),
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          )),
    );
  }

  Widget inputField(
      {required Size size,
      required String placeholder,
      required TextEditingController controller,
      bool obscureText = false}) {
    return Container(
      width: size.width * 0.9,
      height: size.height / 15,
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      child: Expanded(
        child: TextField(
          obscureText: obscureText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
