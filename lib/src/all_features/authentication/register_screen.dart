import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../variables.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/registerscreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 0.5.sh,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.bloodyMary),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              height: 100.h,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 1.sw,
              height: MediaQuery.of(context).size.height / 1.8,
              margin: EdgeInsets.only(left: 15.h, right: 15.h),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        hintStyle: myStyle(20),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        hintStyle: myStyle(20),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.lock),
                        hintStyle: myStyle(20),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () {
                        try {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((signedUser) {
                            userCollection.doc(signedUser.user?.uid).set({
                              {
                                'uid': signedUser.user?.uid,
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'username': _usernameController.text
                              }
                            });
                            Navigator.pop(context);
                          });
                        } catch (error) {
                          debugPrint(error.toString());
                          var snackBar = SnackBar(
                            content: Text(
                              error.toString(),
                              style: myStyle(20),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        width: 0.5.sw,
                        height: 60.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: GradientColors.aqua,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: myStyle(30, Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
