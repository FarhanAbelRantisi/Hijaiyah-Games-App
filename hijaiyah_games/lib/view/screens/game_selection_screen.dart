import 'package:flutter/material.dart';
import '../widgets/game_card.dart';
import 'games/tebak_huruf_game.dart';
import 'games/susun_huruf_game.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
      body: SafeArea(
        child: SingleChildScrollView( // Tambahkan scroll
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Halo, Nurul Hidayah!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/image_profile.png'),
                      radius: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'Progress kamu 20%',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Container(
                      width: 315,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation(Color.fromRGBO(0, 153, 241, 1)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset('assets/images/icon_piala.png', width: 32),
                  ],
                ),

                const SizedBox(height: 28),

                GameCard(
                  imagePath: 'assets/images/icon_tebak_huruf.png',
                  title: 'Game Tebak\nHuruf\nHijaiyah',
                  color: const Color.fromRGBO(165, 214, 167, 1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TebakHurufGame()),
                    );
                  },
                ),

                Center(
                  child: Image.asset(
                    'assets/images/icon_line1.png',
                    fit: BoxFit.contain,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GameCard(
                      imagePath: 'assets/images/icon_susun_huruf.png',
                      title: 'Game Susun\nHuruf\nHijaiyah',
                      color: const Color.fromRGBO(255, 179, 87, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SusunHurufGame()),
                        );
                      },
                    ),
                  ],
                ),

                Center(
                  child: Image.asset(
                    'assets/images/icon_line2.png',
                    fit: BoxFit.contain,
                  ),
                ),

                GameCard(
                  imagePath: 'assets/images/icon_tajwidku_seru.png',
                  title: 'Game\nTajwidku\nSeru',
                  color: const Color.fromRGBO(242, 125, 125, 1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TebakHurufGame()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
