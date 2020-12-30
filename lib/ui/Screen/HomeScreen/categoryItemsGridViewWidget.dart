import 'package:flutter/material.dart';
import 'package:youtube_app/config/appTheme.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/ui/CommomWidgets/roundedImageViewWithoutBorderDynamic.dart';
import 'package:youtube_app/ui/Screen/SelectionScreen/selectionScreen.dart';
import 'package:youtube_app/ui/Screen/SongsListScreen/songsListScreen.dart';

class CategoryItemsGridviewWidget extends StatefulWidget {
  final BuildContext context;

  final List<Songs> songsList;

  CategoryItemsGridviewWidget({this.context, this.songsList});

  @override
  _CategoryItemsGridviewWidgetState createState() =>
      _CategoryItemsGridviewWidgetState();
}

class _CategoryItemsGridviewWidgetState
    extends State<CategoryItemsGridviewWidget> {
  List<Songs> getItemsFromSongsList() {
    List<Songs> fistFourItemsList = [];

    if (widget.songsList.length > 4) {
      for (int i = 0; i < 4; i++) {
        fistFourItemsList.add(widget.songsList[i]);
      }
      return fistFourItemsList;
    } else {
      //print("In Else %%%%%%%%%%");
      return widget.songsList;
    }
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 600),
        backgroundColor: AppTheme.appDefaultColor,
        content:
            Text("$message", style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 10),
              child: Text(
                  "${widget.songsList[0].mainCatName == null ? "Songs" : widget.songsList[0].mainCatName}",
                  style: Theme.of(context).textTheme.button.copyWith(
                        fontSize: 14,
                      )),
            ),
          ),
          Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, right: 0, left: 0, bottom: 0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    return menuItemListViewCard(
                        getItemsFromSongsList()[index], context);
                  },
                  itemCount: getItemsFromSongsList().length,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SongsListScreen(songs: widget.songsList)),
                  );
                },
                child: Container(
                    decoration: new BoxDecoration(
                        color: AppTheme.pieChart1Color3,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(5.0),
                          topRight: const Radius.circular(5.0),
                          bottomLeft: const Radius.circular(5.0),
                          bottomRight: const Radius.circular(5.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "See more",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward_ios_outlined,
                              color: AppTheme.white, size: 15)
                        ],
                      ),
                    )),
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 2,
          //   decoration: new BoxDecoration(
          //     color: AppTheme.lightBlue,
          //       borderRadius: new BorderRadius.only(
          //         topLeft: const Radius.circular(10.0),
          //         topRight: const Radius.circular(10.0),
          //         bottomLeft: const Radius.circular(10.0),
          //         bottomRight: const Radius.circular(50.0),
          //       )),
          // ),
        ],
      ),
    );
  }

  Widget menuItemListViewCard(
    Songs songs,
    BuildContext contex,
  ) {
    return Stack(children: [
      InkWell(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                    topLeft: Radius.circular(2)),
              ),
              child: RoundedCornerImageViewWithoutBorderDynamic(
                  height: MediaQuery.of(context).size.height * 0.2399,
                  width: MediaQuery.of(context).size.width * 0.48,
                  borderWidth: 1,
                  cornerRadius: 15,
                  imageLink: songs.image),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectionScreen(videoId: songs.description,)),
          );
        },
      ),
    ]);
  }
}
