import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Discover")),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            labelStyle:
                TextStyle(fontSize: Sizes.size16, fontWeight: FontWeight.bold),
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(children: [
          for (var tab in tabs)
            Center(
              child: Text(tab,
                  style: TextStyle(
                    fontSize: Sizes.size28,
                  )),
            )
        ]),
      ),
    );
  }
}
