import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floom/src/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  String _username = '';
  final _nameController = TextEditingController();
  final _roomController = TextEditingController();

  bool? _isVideoMuted = true;
  bool? _isAudioMuted = true;

  joinMeeting() async {
    try {
      Map<FeatureFlag, bool> featureFlags = {
        FeatureFlag.isWelcomePageEnabled: false
      };

      if (Platform.isAndroid) {
        featureFlags[FeatureFlag.isCallIntegrationEnabled] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlag.isPipEnabled] = false;
      }

      var options = JitsiMeetingOptions(
          roomNameOrUrl: _roomController.text,
          userDisplayName:
              _nameController.text == '' ? _username : _nameController.text,
          isVideoMuted: _isVideoMuted,
          isAudioMuted: _isAudioMuted,
          featureFlags: featureFlags);

      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (e) {
      debugPrint('Join Meeting Error $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userDoc =
        await userCollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    setState(() {
      _username = userDoc.data()['username'];
    });
  }

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
                controller: _roomController,
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
