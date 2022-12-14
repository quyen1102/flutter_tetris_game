import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_game_tetris_1102/game.dart';
import 'package:flutter_game_tetris_1102/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int speed = 650;
  final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
  String localFile = 'audios/last_christmas.mp3';
  AssetSource url = AssetSource('audios/last_christmas.mp3');

  Future playMusic() async {
    await player.play(url);
  }

  Future stopMusic() async {
    await player.stop();
  }

  Future resumeMusic() async {
    await player.resume();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "Heighest Collection",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 200,
                height: 100,
                child: const Text(
                  "65033",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  fixedSize: const Size(200, 40),
                  elevation: 3,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyGame(
                                speed: speed,
                              )));
                },
                child: const Text('Play game'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  fixedSize: const Size(200, 40),
                  elevation: 3,
                ),
                onPressed: () {
                  playMusic();
                },
                child: const Text('Play music'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  fixedSize: const Size(200, 40),
                  elevation: 3,
                ),
                onPressed: () {
                  stopMusic();
                },
                child: const Text('Stop music'),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                height: 80,
                width: size.width,
                child: const Text(
                  "Choose level",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 100,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        fixedSize: const Size(80, 40),
                        elevation: 3,
                      ),
                      onPressed: () {
                        setState(() {
                          speed = 300;
                        });
                        toast("Selected hard mode");
                      },
                      child: const Text('Hard'),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[900],
                        fixedSize: const Size(80, 40),
                        elevation: 3,
                      ),
                      onPressed: () {
                        setState(() {
                          speed = 650;
                        });
                        toast("Selected normal mode");
                      },
                      child: const Text('Normal'),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                        fixedSize: const Size(80, 40),
                        elevation: 3,
                      ),
                      onPressed: () {
                        setState(() {
                          speed = 1000;
                        });
                        toast("Selected slowly mode");
                      },
                      child: const Text('Slowly'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.deepPurple,
        fontSize: 16.0);
  }
}
