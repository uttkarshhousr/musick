import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/presentation/widgets/neu_box.dart';

class CustomAudioPlayerScreen extends StatefulWidget {
  final Song song;
  final int index;
  bool isplaying;
  CustomAudioPlayerScreen({Key? key, required this.song, required this.index, this.isplaying = false}) : super(key: key);

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration.zero;
        isPlaying = false;
      });
    });

    if (widget.isplaying) {
      _audioPlayer.play(widget.song.songUrl);
      isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 60),
              child: Image.network(
                widget.song.albumArtUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
                    ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration:BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8)
                ),

                  child: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 7,
            child: Hero(
              tag: widget.index,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.song.albumArtUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.background.withOpacity(0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.song.name,
                            style: myThemePlayfair.textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.song.artist,
                            style: myThemePlayfair.textTheme.displaySmall?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_duration != null && _duration.inMilliseconds > 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            Slider(
                              onChanged: (value) {
                                final duration = _duration;
                                if (duration == null) {
                                  return;
                                }
                                final position = value * duration.inMilliseconds;
                                _audioPlayer.seek(Duration(milliseconds: position.round()));
                              },
                              value: (_position != null &&
                                  _duration != null &&
                                  _position.inMilliseconds > 0 &&
                                  _position.inMilliseconds < _duration.inMilliseconds)
                                  ? _position.inMilliseconds / _duration.inMilliseconds
                                  : 0.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.replay_10),
                            onPressed: () {
                              _audioPlayer.seek(_position - const Duration(seconds: 10));
                            },
                          ),
                          IconButton(
                            icon: Image.asset(isPlaying ? AppImages.pause : AppImages.play,width: 50,height: 50,),
                            onPressed: () {
                              if (isPlaying) {
                                _audioPlayer.pause();
                              } else {
                                _audioPlayer.play(widget.song.songUrl);
                              }
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.forward_10),
                            onPressed: () {
                              _audioPlayer.seek(_position + const Duration(seconds: 10));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
