import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int benar;
  final int totalQuestions;
  final VoidCallback onRetry;

  const ResultScreen({
    super.key,
    required this.score,
    required this.benar,
    required this.totalQuestions,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_result.png'),
                    const SizedBox(width: 4),
                    const Text(
                      'Selamat',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset('assets/images/icon_result.png'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kamu sudah menyelesaikan\nseluruh kuis tebak huruf\nhijaiyah!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Total Poin yang didapat: $score pts',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 337,
                  height: 69,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(165, 214, 167, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Jawaban benar: $benar/$totalQuestions',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hebat Banget, Semangat terus\nuntuk kuis kuis selanjutnya ya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button "Ulangi Kuis"
                    SizedBox(
                      width: 163,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: onRetry,
                        child: const Text(
                          'Ulangi Kuis',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Button "Menu Utama"
                    SizedBox(
                      width: 163,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 153, 241, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text(
                          'Menu Utama',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
