import 'package:flutter/material.dart';
import '../games/tebak_huruf/tebak_huruf_game.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Game")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Game Tebak Huruf"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TebakHurufGame()),
            );
          },
        ),
      ),
    );
  }
}
