import 'package:flutter/material.dart';
import 'package:majlaat/widgets/custom_screen.dart';
import 'package:pod_player/pod_player.dart';

class VideoScreen extends StatefulWidget {
  String videoUrl;
  VideoScreen({
    super.key,
    required this.videoUrl,
  });

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  @override
  void dispose() {
    controller.dispose();
    controller.pause();
    super.dispose();
  }

  @override
  void deactivate() {
    controller.dispose();
    controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        title: '',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.videoUrl != null || widget.videoUrl != ''
                ? GestureDetector(
                    onTap: () {},
                    child: PodVideoPlayer(
                      controller: controller,
                    ),
                  )
                : Text('No Video'),
          ],
        ));
  }

  playVideo() {
    if (widget.videoUrl != null || widget.videoUrl != '') {
      if (widget.videoUrl.contains('youtu')) {
        print('youtube video');

        controller = PodPlayerController(
            playVideoFrom: PlayVideoFrom.youtube(
          widget.videoUrl,
        ))
          ..initialise();
      } else {
        print('normal video');

        controller = PodPlayerController(
            playVideoFrom: PlayVideoFrom.network(
          widget.videoUrl,
        ))
          ..initialise();
      }
    }
  }
}
