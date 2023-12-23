import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class SoundAppScreen extends StatefulWidget {
  const SoundAppScreen({super.key});

  @override
  State<SoundAppScreen> createState() => _SoundAppScreenState();
}

class _SoundAppScreenState extends State<SoundAppScreen> {
  final assetss = "assets/images";
  final audioss = AudioPlayer();
  List images = [
    "assets/images/baby-sneeze.png",
    "assets/images/blowing-nose.png",
    "assets/images/clock-ticking-60-second-countdown.png",
    "assets/images/coughing.png",
    "assets/images/dj-airhorn-sound.png",
    "assets/images/doorbell.png",
    "assets/images/electric-razor-shaver.png",
    "assets/images/fart.png",
    "assets/images/hair-clipper.png",
    "assets/images/police.png",
    "assets/images/police-car-siren-in-traffic.png",
    "assets/images/shop-door.png",
    "assets/images/vegan-fart-voice.png",
    "assets/images/wrong-place.png",
  ];
  List names = [
    'Baby',
    'Blowing Nose',
    'Clock',
    'Cough',
    'Airhoen',
    'DoorBell',
    'Razor',
    'FArt',
    'Hair',
    'Police',
    'Siren',
    'Door',
    'Vegan ',
    'Wrong'
  ];
  List sounds = [
    "assets/images/baby-sneeze.mp3",
    "assets/images/blowing-nose.mp3",
    "assets/images/clock-ticking-60-second-countdown.mp3",
    "assets/images/coughing.mp3",
    "assets/images/dj-airhorn-sound.mp3",
    "assets/images/doorbell.mp3",
    "assets/images/electric-razor-shaver.mp3",
    "assets/images/fart.mp3",
    "assets/images/hair-clipper.mp3",
    "assets/images/police.mp3",
    "assets/images/police-car-siren-in-traffic.mp3",
    "assets/images/shop-door.mp3",
    "assets/images/vegan-fart-voice.mp3",
    "assets/images/wrong-place.mp3",
    'assets/images/lottie.json',
  ];
  bool play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sound APP"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        itemCount: 15,
        itemBuilder: (context, index) {
          if (index > 13) {
            print("index--$index");
            return Lottie.asset(sounds[index], height: 100);
          }
          return ListTile(
            onTap: () async {
              await audioss.setAsset(sounds[index],
                  preload: true, initialPosition: Duration(seconds: 1));
              audioss.play();
              setState(() {
                play = true;
              });
            },
            leading: CircleAvatar(backgroundImage: AssetImage(images[index])),
            title: Text(names[index]),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  if (play) {}
                },
                icon: Icon(Icons.skip_previous_outlined)),
            IconButton(
                onPressed: () {
                  if (play) {
                    audioss.pause();
                  } else {
                    audioss.play();
                  }
                  setState(() {
                    play = !play;
                  });
                },
                icon: Icon(play ? Icons.pause : Icons.play_arrow_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
          ],
        ),
      ),
    );
  }
}
