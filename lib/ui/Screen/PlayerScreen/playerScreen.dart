import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_app/config/methods.dart';
import 'package:youtube_app/ui/CommomWidgets/commonWidgets.dart';
import 'package:youtube_app/ui/CommomWidgets/roundedImageViewWithoutBorderDynamic.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_app/model/packages.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final int settings;
  VideoPlayerScreen({this.videoId, this.settings});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController controller;
  var yt = YoutubeExplode();

  bool loader;
  String audioUrl;
  String videoUrl;

  @override
  void initState() {
    loader = true;
    super.initState();

    extractStreamUrl(widget.videoId);
  }

  extractStreamUrl(String videoId) async {


    var manifest = await yt.videos.streamsClient.getManifest(
      videoId,
    );

    
    print(manifest.muxed.first.url);
    videoUrl = manifest.muxed.first.url.toString();
    audioUrl = manifest.audioOnly.first.url.toString();

    setState(() {
      loader = false;
    });

    print('\n\n---------------------\n\n');

    if (widget.settings == 1) {
      controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });

      yt.close();
    }
    if (widget.settings == 2) {
      controller = VideoPlayerController.network(audioUrl)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });

      yt.close();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
     // body: YouVimPlayer('youtube','AGBjI0x9VbM') 



       
        body: loader == true
            ? Center(child: CommonWidgets.progressIndicator)
            : widget.settings == 1
                ? _buildBodyForVideoPlayer(context,)
                : _buildBodyForAudioPlayer(context));
  }

  Widget _buildBodyForVideoPlayer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 0.0)),
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            padding: const EdgeInsets.all(0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(controller),
                ControlsOverlay(controller: controller),
                VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyForAudioPlayer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 0.0)),
          Container(
            height: MediaQuery.of(context).size.height*0.40,
            padding: const EdgeInsets.all(0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RoundedCornerImageViewWithoutBorderDynamic(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  imageLink: Methods.getUrlToLoadYoutubrThumbNail(widget.videoId),
                  cornerRadius: 5,
                  borderWidth: 1,
                ),
                // VideoPlayer(controller),
                ControlsOverlayAudio(controller: controller),
                VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ControlsOverlay extends StatefulWidget {
  final VideoPlayerController controller;

  ControlsOverlay({Key key, this.controller}) : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  @override
  _ControlsOverlayState createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
            duration: Duration(milliseconds: 50),
            reverseDuration: Duration(milliseconds: 200),
            child: !widget.controller.value.isPlaying
                ? Container(
                    color: Colors.black38,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                  )
                : SizedBox.shrink()),
        GestureDetector(
          onTap: () {
            setState(() {});
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
          },
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: PopupMenuButton<double>(
        //     initialValue: widget.controller.value.playbackSpeed,
        //     tooltip: 'Playback speed',
        //     onSelected: (speed) {
        //       widget.controller.setPlaybackSpeed(speed);
        //     },
        //     itemBuilder: (context) {
        //       return [
        //         for (final speed in ControlsOverlay._examplePlaybackRates)
        //           PopupMenuItem(
        //             value: speed,
        //             child: Text('${speed}x'),
        //           )
        //       ];
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // Using less vertical padding as the text is also longer
        //         // horizontally, so it feels like it would need more spacing
        //         // horizontally (matching the aspect ratio of the video).
        //         vertical: 12,
        //         horizontal: 16,
        //       ),
        //       child: Text('${widget.controller.value.playbackSpeed}x'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class ControlsOverlayAudio extends StatefulWidget {
  final VideoPlayerController controller;
  final Songs song;

  ControlsOverlayAudio({Key key, this.controller, this.song}) : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  @override
  _ControlsOverlayAudioState createState() => _ControlsOverlayAudioState();
}

class _ControlsOverlayAudioState extends State<ControlsOverlayAudio> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
            duration: Duration(milliseconds: 50),
            reverseDuration: Duration(milliseconds: 200),
            child: !widget.controller.value.isPlaying
                ? Container(
                    color: Colors.black38,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                  )
                : SizedBox.shrink()),
        GestureDetector(
          onTap: () {
            setState(() {});
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
          },
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: PopupMenuButton<double>(
        //     initialValue: widget.controller.value.playbackSpeed,
        //     tooltip: 'Playback speed',
        //     onSelected: (speed) {
        //       widget.controller.setPlaybackSpeed(speed);
        //     },
        //     itemBuilder: (context) {
        //       return [
        //         for (final speed in ControlsOverlay._examplePlaybackRates)
        //           PopupMenuItem(
        //             value: speed,
        //             child: Text('${speed}x'),
        //           )
        //       ];
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // Using less vertical padding as the text is also longer
        //         // horizontally, so it feels like it would need more spacing
        //         // horizontally (matching the aspect ratio of the video).
        //         vertical: 12,
        //         horizontal: 16,
        //       ),
        //       child: Text('${widget.controller.value.playbackSpeed}x'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
