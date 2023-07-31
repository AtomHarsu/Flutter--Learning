import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExpandedTile extends StatefulWidget {
  const ExpandedTile({super.key});

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  List<tile> items = [];

  tile selecttile = tile(
    playerName: 'harsh',
    description: 'dFadQFHiufhFU',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  // Replace 'YOUR_YOUTUBE_VIDEO_ID' with the ID of the YouTube video you want to show
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: '9oG1SDlHIjI',
                    flags: YoutubePlayerFlags(
                      autoPlay:
                          true, // Set to false if you don't want the video to play automatically
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  );

                  
                },
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              selecttile.playerName!,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  selecttile.description!,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class tile {
  String? playerName, description;
  tile({
    this.playerName,
    this.description,
  });
}
