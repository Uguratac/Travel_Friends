import 'package:flutter/material.dart';
import 'package:travel_friends/pages/home_page.dart';
import 'package:travel_friends/pages/messages_page.dart';
import 'package:travel_friends/pages/profile_page.dart';
import 'package:travel_friends/pages/publish_travel_page.dart';
import 'package:travel_friends/pages/travels_page.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  State<MyTabbar> createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: const [
            MyHomePage(),
            MyProfilePage(),
            MyTravelPage(),
            MyPublishTravelPage(),
            MyMessagesPage(),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Container(
              color: const Color.fromARGB(255, 94, 163, 140),
              child: TabBar(
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 10.0),
                indicatorColor: Colors.amber,
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.search,
                      size: 24.0,
                    ),
                    text: 'Ara',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.travel_explore,
                      size: 24.0,
                    ),
                    text: 'Yolculuklar',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.access_alarms_outlined,
                      size: 24.0,
                    ),
                    text: 'Yayınla',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.message,
                      size: 24.0,
                    ),
                    text: 'Mesajlar',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    text: 'Profil',
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
