import 'package:floom/src/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  final _nameController = TextEditingController();
  bool? _isVideoMuted = true;
  bool? _isAudioMuted = true;

  joinMeeting() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Room Code',
              style: myStyle(20),
            ),
            SizedBox(
              height: 20.h,
            ),
            PinCodeTextField(
                appContext: context,
                length: 6,
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                ),
                onChanged: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: _nameController,
              style: myStyle(18),
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name (Leave blank for using username)',
                  labelStyle: myStyle(15.sp)),
            ),
            SizedBox(
              height: 16.h,
            ),
            CheckboxListTile(
                title: const Text('Video Muted'),
                value: _isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    _isVideoMuted = value;
                  });
                }),
            SizedBox(
              height: 16.h,
            ),
            CheckboxListTile(
                title: const Text('Audio Muted'),
                value: _isAudioMuted,
                onChanged: (value) {
                  setState(() {
                    _isAudioMuted = value;
                  });
                }),
            Divider(
              height: 48.h,
              thickness: 2.0,
            ),
            InkWell(
              onTap: () => joinMeeting(),
              child: Container(
                width: double.maxFinite,
                height: 50.h,
                decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: GradientColors.facebookMessenger),
                ),
                child: Center(
                    child: Text(
                  'Join Meeting',
                  style: myStyle(20),
                )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
