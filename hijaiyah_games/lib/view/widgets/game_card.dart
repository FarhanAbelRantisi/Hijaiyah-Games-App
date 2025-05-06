import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const GameCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 226,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 72,
            height: 72,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 153, 241, 1),
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Mainkan',
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
    );
  }
}
