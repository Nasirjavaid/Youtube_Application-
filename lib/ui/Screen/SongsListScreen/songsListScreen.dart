import 'package:flutter/material.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/ui/CommomWidgets/roundedImageViewWithoutBorderDynamic.dart';
import 'package:youtube_app/ui/Screen/SelectionScreen/selectionScreen.dart';

class SongsListScreen extends StatefulWidget {
  final List<Songs> songs;

  SongsListScreen({this.songs});
  @override
  _SongsListScreenState createState() => _SongsListScreenState();
}

class _SongsListScreenState extends State<SongsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Songs",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 18))),
        body: packagesListView(widget.songs),
      ),
    );
  }

  Widget packagesListView(List<Songs> songs) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        return menuItemListViewCard(songs[index], context);
      },
      itemCount: songs.length,
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
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedCornerImageViewWithoutBorderDynamic(
                      height: MediaQuery.of(context).size.height * 0.2399,
                      width: MediaQuery.of(context).size.width * 0.48,
                      borderWidth: 1,
                      cornerRadius: 15,
                      imageLink: songs.image),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectionScreen(
                      videoId: songs.description
                    )),
          );
        },
      ),
    ]);
  }
}
