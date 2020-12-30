import 'package:flutter/material.dart';
import 'package:youtube_app/config/methods.dart';
import 'package:youtube_app/ui/CommomWidgets/roundedImageViewWithoutBorderDynamic.dart';
import 'package:youtube_app/ui/Screen/PlayerScreen/playerScreen.dart';

class SelectionScreen extends StatefulWidget {
  final String videoId;
  SelectionScreen({this.videoId});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: [
      RoundedCornerImageViewWithoutBorderDynamic(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        imageLink: Methods.getUrlToLoadYoutubrThumbNail( widget.videoId),
        cornerRadius: 5,
      ),
      SizedBox(
        height: 20,
      ),
      playVideoCard(context),
      playAudioCard(context)
    ]);
  }

  Widget playVideoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                      videoId: widget.videoId,
                      settings: 1,
                    )),
          );
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
            child: Row(children: [
              Icon(Icons.video_library, color: Colors.red[300], size: 50),
              SizedBox(
                width: 12,
              ),
              Text(
                "Play Video",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w800),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget playAudioCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: InkWell(
        onTap: () {

          
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                      videoId: widget.videoId,
                      settings: 2,
                    )),
          );
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(children: [
              Icon(Icons.volume_up, color: Colors.green[300], size: 50),
              SizedBox(
                width: 12,
              ),
              Text(
                "Play Audio",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w800),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
