import 'package:flutter/material.dart';
import 'package:youtube_app/config/methods.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/ui/CommomWidgets/roundedImageViewWithoutBorderDynamic.dart';
import 'package:youtube_app/ui/Screen/SelectionScreen/selectionScreen.dart';

class SongOfTheWidget extends StatelessWidget {
  final Songoftheday songOfTheDay;
  SongOfTheWidget({this.songOfTheDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Song of the day",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SelectionScreen(videoId: songOfTheDay.keyword)));
              },
              child: RoundedCornerImageViewWithoutBorderDynamic(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width,
                borderWidth: 1,
                cornerRadius: 15,
                imageLink:
                    Methods.getUrlToLoadYoutubrThumbNail(songOfTheDay.keyword),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
