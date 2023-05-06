import 'package:floom/src/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({super.key});

  @override
  State<CreateMeeting> createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = '';

  createCode() {
    setState(() {
      code = const Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              'Create a code and share it with your friends',
              style: myStyle(20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Code: ',
                style: myStyle(25),
              ),
              Text(
                code,
                style: myStyle(25),
              ),
            ],
          ),
          SizedBox(
            height: 35.h,
          ),
          InkWell(
            onTap: () => createCode(),
            child: Container(
              width: 0.5.sw,
              height: 40.h,
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: GradientColors.facebookMessenger),
              ),
              child: Center(
                  child: Text(
                'Create Code',
                style: myStyle(20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
