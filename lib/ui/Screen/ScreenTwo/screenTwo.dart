import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:tuple/tuple.dart';
import 'package:youtube_app/config/appTheme.dart';
import 'package:youtube_app/ui/Screen/ScreenTwo/categoryTabScreenTwo.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/cetegoryItemsListviewWidget.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/categoryItemsGridViewWidget.dart';



class ScreenTwo extends StatefulWidget {
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo>
    with SingleTickerProviderStateMixin {
  // final FoodCategoryRepository foodCategoryRepository =
  //     FoodCategoryRepository();

  TabController _tabController;

  List<String> categoryList = [
    "Cat1"
        "Cat2"
        "Cat3"
        "Cat4"
        "Cat5"
        "Cat6"
        "Cat7"
  ];

  List<Tuple2> _pages;
  // final FoodCategoryRepository foodCategoryRepository = FoodCategoryRepository();
  @override
  void initState() {
    _pages = [
      Tuple2(
          CategoryTabScreenTwo("Latest Songs", Colors.white, 12),
          CategoryItemsListviewWidget(
            context: context,
          )),
      Tuple2(
          CategoryTabScreenTwo("20's", Colors.white, 12),
          CategoryItemsGridviewWidget(
            context: context,
          )),
      Tuple2(
          CategoryTabScreenTwo("90's", Colors.white, 12),
          CategoryItemsListviewWidget(
            context: context,
          )),
      Tuple2(
          CategoryTabScreenTwo("Old is Gold", Colors.white, 12),
          CategoryItemsGridviewWidget(
            context: context,
          )),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//     return BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
//       builder: (context, state) {
//         //initial state is data is loading  from the repository show loading indicator
//         if (state is FoodCategoryInProgressState) {
//           return LoadingIndicator();
//         }
//         // If any error then show error message
//         if (state is FoodCategoryFailureState) {
//           return InkWell(
//             onTap: () {
//               NetworkConnectivity.check().then((internet) {
//                 if (internet) {
//                   BlocProvider.of<FoodCategoryBloc>(context)
//                       .add(FoodCategoryEventFetched());
//                 } else {
//                   //show network erro

//                   Methods.showToast(context, "Check your network");
//                 }
//               });
//             },
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("No items",
//                       style: Theme.of(context).textTheme.bodyText1.copyWith(
//                             color: Colors.black38,
//                           )),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("Tap to Reload",
//                       style: Theme.of(context).textTheme.bodyText2.copyWith(
//                             color: Colors.black45,
//                           )),
//                 ],
//               ),
//             ),
//           );
//         }
//         // if data is Successfully obtained pass to widget body
//         if (state is FoodCategorySuccessState) {
// // state.foodCategory.data.length

    // for (int i = 0; i < categoryList.length; i++) {
    //   _pages.add(
    //       Tuple2(CategoryTabs(categoryList[i]), CategoryItemsListviewWidget()));
    // }
    _tabController = TabController(length: _pages.length, vsync: this);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: DefaultTabController(
        length: _pages.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: MyTabsHorizontalList(
                    color: Colors.black26,
                    tabBar: TabBar(
                      isScrollable: true,
                      // indicatorColor: AppTheme.appDefaultColor,
                      controller: _tabController,
                      tabs: _pages
                          .map<Tab>((Tuple2 page) => Tab(icon: page.item1))
                          .toList(),
                      labelColor: AppTheme.appDefaultColor,
                      unselectedLabelColor: AppTheme.appDefaultColor,
                      indicator: RectangularIndicator(
                        strokeWidth: 1,
                        color: Colors.black54,
                        bottomLeftRadius: 100,
                        bottomRightRadius: 100,
                        topLeftRadius: 100,
                        topRightRadius: 100,
                      ),
                    )),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
          ),
        ),
      ),
    );
  }
  //   return Center(child: Text("Nothing here"));
  // },
  //);
  // }
}

class MyTabsHorizontalList extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;
  final double expandedHeight;
  final double collapsedHeight;

  MyTabsHorizontalList(
      {@required this.tabBar,
      this.color,
      this.collapsedHeight,
      this.expandedHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
