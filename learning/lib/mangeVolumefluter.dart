import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:volume_control/volume_control.dart';

class SoundControlScreen extends StatefulWidget {
  @override
  _SoundControlScreenState createState() => _SoundControlScreenState();
}

class _SoundControlScreenState extends State<SoundControlScreen> {
  VolumeControl volumeControl = VolumeControl();
  AudioPlayer audioPlayer = AudioPlayer();

  double mediaVolume = 0.5;
  double audioPlaybackVolume = 0.5;

  void setMediaVolume(double volume) {
    VolumeControl.setVolume(volume);
    setState(() {
      mediaVolume = volume;
    });
  }

  void setAudioPlaybackVolume(double volume) {
    audioPlayer.setVolume(volume);
    setState(() {
      audioPlaybackVolume = volume;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Media Volume: ${(mediaVolume * 100).toInt()}%'),
            Slider(
              value: mediaVolume,
              onChanged: setMediaVolume,
            ),
            Text(
                'Audio Playback Volume: ${(audioPlaybackVolume * 100).toInt()}%'),
            Slider(
              value: audioPlaybackVolume,
              onChanged: setAudioPlaybackVolume,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
