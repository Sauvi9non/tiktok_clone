import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          collapsedHeight: 80,
          expandedHeight: 200,
          elevation: 1,
          backgroundColor: Colors.green,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Title"),
            background: Image.asset(
              "assets/images/toru.jpeg",
              fit: BoxFit.cover,
            ),
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              color: Colors.teal[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
            childCount: 20,
          ),
          itemExtent: 100,
        ),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
            childCount: 40,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
        ),
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text("Title!"),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    //이거 빌드 되어야 하는거임? 이라고 묻는 함수
    return false;
  }
}
