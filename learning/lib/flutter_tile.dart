import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatelessWidget {
  final List<VideoData> videos = [
    VideoData(
      title: 'Video 1',
      videoId: 'm272eGVwbdE',
      description: 'Description for Video 1',
    ),
    VideoData(
      title: 'Video 2',
      videoId: 'uQe0l-8AAgI',
      description: 'Description for Video 2',
    ),
    // Add more VideoData objects here for additional videos.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Thumbnails in ExpansionTile'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoExpansionTile(videoData: videos[index]);
        },
      ),
    );
  }
}

class VideoData {
  final String title;
  final String videoId;
  final String description;

  VideoData(
      {required this.title, required this.videoId, required this.description});
}

class VideoExpansionTile extends StatelessWidget {
  final VideoData videoData;

  VideoExpansionTile({required this.videoData});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(videoData.title),
      children: <Widget>[
        YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoData.videoId,
            flags: YoutubePlayerFlags(
              autoPlay: true,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
        SizedBox(height: 8),
        Text(videoData.description),
      ],
    );
  }
}
