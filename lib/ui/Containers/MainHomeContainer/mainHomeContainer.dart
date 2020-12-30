import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_app/config/appTheme.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/homeScreen.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/myNavDrawer.dart';
import 'package:youtube_app/ui/Screen/ScreenFive/ScreenFive.dart';
import 'package:youtube_app/ui/Screen/ScreenFour/screenFour.dart';
import 'package:youtube_app/ui/Screen/ScreenThree/screenThree.dart';
import 'package:youtube_app/ui/Screen/ScreenTwo/screenTwo.dart';

// class HomeCintainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         return CartBloc();
//       },
//       child: MainHomeContainer(),
//     );
//   }
// }

class MainHomeContainer extends StatefulWidget {
  @override
  _MainHomeContainerState createState() => _MainHomeContainerState();
}

class _MainHomeContainerState extends State<MainHomeContainer>
    with WidgetsBindingObserver {
  int _currentIndex = 0;

  final allScreenDestiNations = [
    MenuScreenMain(),
    ScreenTwo(),
    ScreenThree(),
    ScreenFour(),
    ScreenFive(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // Methods.storeStateToSharedPref(false);
    WidgetsBinding.instance.addObserver(this);
    callCartFromSharedPrefrences();

    super.initState();
  }

  void callCartFromSharedPrefrences() async {
    // BlocProvider.of<CartBloc>(context)
    //     .add(GetDataFromSharedPrefrencesCartEvent());
  }

  @override
  void dispose() {
    // BlocProvider.of<CartBloc>(context)
    //     .add(SaveDataToSharedPrefrencesCartEvent());
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     BlocProvider.of<CartBloc>(context)
  //         .add(SaveDataToSharedPrefrencesCartEvent());
  //   }

  //   if (state == AppLifecycleState.resumed) {
  //     BlocProvider.of<CartBloc>(context)
  //         .add(GetDataFromSharedPrefrencesCartEvent());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppTheme.background,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(icon: Icon(Icons.search), onPressed: null),
        // ],
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "My Youtube",
          style: Theme.of(context).textTheme.button,
        ),
      ),
      body: SafeArea(
        top: false,
        child:
            IndexedStack(index: _currentIndex, children: allScreenDestiNations),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.appDefaultColor,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                FontAwesomeIcons.peopleArrows,
                size: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'FOR YOU',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                FontAwesomeIcons.list,
                size: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'SONGS',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.music_note,
                size: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'MUSIC',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.radio,
                size: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'TALK',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.video_library,
                size: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'VIDEOS',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
          )
        ],
      ),
      drawer: MyNavDrawer(context),
    );
  }
}
