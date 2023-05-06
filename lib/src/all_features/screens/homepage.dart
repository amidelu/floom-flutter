import 'package:floom/src/all_features/video_conference/create_meeting.dart';
import 'package:floom/src/all_features/video_conference/join_meeting.dart';
import 'package:floom/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  _buildTab(String name) => SizedBox(
        width: 150.w,
        height: 50.h,
        child: Card(
          child: Center(
            child: Text(name),
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FLOOM'),
        backgroundColor: Colors.blue[400],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: [
          _buildTab('Join Meeting'),
          _buildTab('Create Meeting'),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        JoinMeeting(),
        CreateMeeting(),
      ]),
    );
  }
}
