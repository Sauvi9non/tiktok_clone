import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

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
          title: CupertinoSearchTextField(),
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
          GridView.builder(
            itemCount: 20,
            padding: EdgeInsets.all(Sizes.size6),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 9 / 16,
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10),
            itemBuilder: (item, index) => Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size4,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9, //16,
                    child: FadeInImage.assetNetwork(
                      placeholderFit: BoxFit.cover,
                      fit: BoxFit.cover,
                      placeholder: "assets/images/toru.jpeg",
                      image:
                          "https://health.chosun.com/site/data/img_dir/2023/06/01/2023060102001_0.jpg",
                    ),
                  ),
                ),
                Gaps.v10,
                Text(
                  "jfdijisjjdilfjdifjeklwijsodjkfaifdsojdifhigesgfgfffffffgfg",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.v5,
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://cdn.huffingtonpost.kr/news/photo/202102/106154_199722.jpeg",
                        ),
                      ),
                      Gaps.h5,
                      Expanded(
                        child: Text(
                          "jakdjfkdasdfdfdadf",
                          maxLines: 1,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: 10,
                        color: Colors.grey,
                      ),
                      Text(
                        "2.5M",
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (var tab in tabs.skip(1)) //첫번째 요소는 스킵
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
