import 'package:floom/src/variables.dart';
import 'package:floom/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = '/authscreen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, logInScreen),
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
                          'SIGN IN',
                          style: myStyle(30, Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, registerScreen),
                    child: Container(
                      width: 0.5.sw,
                      height: 60.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: GradientColors.pink,
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
          )
        ],
      ),
    );
  }
}
