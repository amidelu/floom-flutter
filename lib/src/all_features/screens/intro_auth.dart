import 'package:floom/src/variables.dart';
import 'package:floom/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuth extends StatefulWidget {
  const IntroAuth({super.key});

  @override
  State<IntroAuth> createState() => _IntroAuthState();
}

class _IntroAuthState extends State<IntroAuth> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome',
          body: 'Welcome to FLOOM, best video conference app',
          image: Image.asset(
            'assets/images/welcome.png',
            height: 172,
          ),
          decoration: PageDecoration(
              bodyTextStyle: myStyle(20), titleTextStyle: myStyle(20)),
        ),
        PageViewModel(
          title: 'Join or Start',
          body: 'Join or Start a meeting at a glance',
          image: Image.asset(
            'assets/images/conference.png',
            height: 172,
          ),
          decoration: PageDecoration(
              bodyTextStyle: myStyle(20), titleTextStyle: myStyle(20)),
        ),
        PageViewModel(
          title: 'Security',
          body:
              'Your security is our main concern. Our server is well secured and reliable',
          image: Image.asset(
            'assets/images/secure.jpg',
            height: 172,
          ),
          decoration: PageDecoration(
              bodyTextStyle: myStyle(20), titleTextStyle: myStyle(20)),
        ),
      ],
      onDone: () {
        Navigator.popAndPushNamed(context, authScreen);
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        'Done',
        style: myStyle(20),
      ),
    );
  }
}
