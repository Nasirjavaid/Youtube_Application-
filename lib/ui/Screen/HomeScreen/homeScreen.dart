import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_app/bloc/packagesBloc.dart';
import 'package:youtube_app/bloc/packagesEvent.dart';
import 'package:youtube_app/bloc/packagesState.dart';
import 'package:youtube_app/config/methods.dart';
import 'package:youtube_app/config/networkConectivity.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/ui/CommomWidgets/commonWidgets.dart';
import 'package:youtube_app/ui/CommomWidgets/imageSlider.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/categoryItemsGridViewWidget.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/songOfTheDayWidget.dart';


class MenuScreenMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PackagesBloc()..add(FetchAllPackesEvent()),
        child: HomeScreen(context));
  }
}

class HomeScreen extends StatefulWidget {
  final BuildContext context;
  HomeScreen(this.context);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    "https://www.pymnts.com/wp-content/uploads/2019/09/DoorDash-Chowly-Panera-Postmates-restaurants-delivery.jpg",
    "https://blog.doemal.com/en/wp-content/uploads/sites/2/2019/03/Features-1.jpg",
    "https://www.jetsetter.com/uploads/sites/7/2018/07/2zFs3Mzm-1380x690.jpeg",
    "https://www.sitchu.com.au/media/images/bistro-moncur-french-restaurant-sydney_2.original.jpg"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Home Screen",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 18))),
      body: BlocBuilder<PackagesBloc, PackagesState>(
        builder: (BuildContext context, state) {
          if (state is PackagesInProgressState) {
            return CommonWidgets.progressIndicator;
          }
          if (state is PackagesInSuccessState) {
            return buildBody(state.packages);
          }

          if (state is PackagesInFailedState) {
            return Center(
              child: Center(child: Text("Failed")),
            );
          }

          return Container();
        },
      ),
    );
  }
  Widget failedWidget(BuildContext context) {
    return FlatButton(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No items",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.black38,
                    )),
            SizedBox(
              height: 8,
            ),
            Text("Tap to Reload",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.black45,
                    )),
          ],
        ),
      ),
      onPressed: () {
        NetworkConnectivity.check().then((internet) {
          if (internet) {
            BlocProvider.of<PackagesBloc>(context).add(FetchAllPackesEvent());
          } else {
            //show network erro

            Methods.showToast(context, "Check your network");
          }
        });
      },
    );
  }


  Widget buildBody(Packages packages) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.22,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  // ImageSlider(state.foodCategory.data.sliderinfo),
                  ImageSlider(packages.headers),
            ),
          ),
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.30,
            automaticallyImplyLeading: false,
            // title: Text("Song of the day"),
            flexibleSpace:  FlexibleSpaceBar(
                background:
                    // ImageSlider(state.foodCategory.data.sliderinfo),
                    SongOfTheWidget(
                  songOfTheDay: packages.songoftheday[0],
                ),
              ),
            
          ),
          // SliverAppBar(
          //   toolbarHeight: 35,
          //   expandedHeight: 30,
          //   automaticallyImplyLeading: false,
          //   centerTitle: false,
          //   title: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 2.0),
          //     child: Text(
          //       "My collection",
          //       style: Theme.of(context)
          //           .textTheme
          //           .button
          //           .copyWith(fontSize: 15, fontWeight: FontWeight.w800),
          //     ),
          //   ),
          //   pinned: true,
          // ),
        ];
      },
      body: packagesListView(packages),
    );
  }

  Widget packagesListView(Packages packages) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 25, left: 5, right: 5, top: 0),
        itemCount: packages.listsOfSongs.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          // return index % 2 == 0
          //     ? SongOfTheWidget(
          //         songOfTheDay: packages.songoftheday[0],
          //       )
          //     : CategoryItemsGridviewWidget(
          //         songsList: packages.listsOfSongs[index],
          //       );

          return CategoryItemsGridviewWidget(
            songsList: packages.listsOfSongs[index],
          );
        });
  }
}
