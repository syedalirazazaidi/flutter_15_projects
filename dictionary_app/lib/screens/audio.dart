import 'package:dictionary_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatelessWidget {
  static const String routeName = '/audioPlayer';
  AudioPlayerScreen({required this.url});
  final String? url;
  final _player = AudioPlayer();
  void playAudio() async {
    try {
      if (url != null) {
        await _player.setUrl(
          url!,
        );
        await _player.play();
      }
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.playaudio),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: playAudio,
              child: Icon(Icons.play_arrow, size: 100, color: Colors.purple)),
          Center(
            child: Text(
              AppStrings.play,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
