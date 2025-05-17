import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodel/tebak_huruf_viewmodel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../../../view/screens/result_screen.dart';



bool isArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}

class TebakHurufGame extends StatelessWidget {
  const TebakHurufGame({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 24.0;

    return ChangeNotifierProvider(
      create: (_) => TebakHurufViewmodel(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(170, 219, 233, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: Consumer<TebakHurufViewmodel>(
                builder: (context, controller, _) {
                  final question = controller.currentQuestion;
                  final FlutterTts flutterTts = FlutterTts();

                  final containerWidth = screenWidth - 2 * horizontalPadding;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    width: containerWidth,
                    height: 639,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${controller.score} pts',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Soal ${controller.currentIndex + 1} dari 10',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 165, 214, 167),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  question.text,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 165, 214, 167),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  question.word,
                                  style: TextStyle(
                                    fontSize: isArabic(question.word) ? 40 : 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 153, 241, 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.volume_up, color: Colors.white, size: 28),
                            onPressed: () {
                              _speak(question.word, flutterTts);
                            },
                          ),
                        ),

                        const SizedBox(height: 14),

                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildOption(context, controller, question.options[0], index: 0, maxWidth: (containerWidth - 8) / 2),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildOption(context, controller, question.options[1], index: 1, maxWidth: (containerWidth - 8) / 2),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildOption(context, controller, question.options[2], index: 2, maxWidth: (containerWidth - 8) / 2),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildOption(context, controller, question.options[3], index: 3, maxWidth: (containerWidth - 8) / 2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (controller.isAnswered)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              controller.selectedAnswer == question.correctAnswer
                                  ? 'Bagus sekali!\nJawaban kamu benar 🎉'
                                  : "Yuk coba lagi! Jawaban yang\nbenar adalah '${question.correctAnswer}'",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: controller.selectedAnswer == question.correctAnswer
                                    ? const Color.fromRGBO(90, 193, 120, 1)
                                    : const Color.fromRGBO(242, 125, 125, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: SizedBox(
                            width: containerWidth,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.isAnswered
                                    ? const Color.fromRGBO(0, 153, 241, 1)
                                    : const Color.fromRGBO(0, 102, 170, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: controller.isAnswered
                                  ? () {
                                      if (controller.currentIndex < controller.questions.length - 1) {
                                        controller.currentIndex++;
                                        controller.selectedAnswer = null;
                                        controller.notifyListeners();
                                      } else {
                                        controller.isFinished = true;
                                        Future.delayed(const Duration(milliseconds: 100), () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ResultScreen(
                                                score: controller.score,
                                                totalQuestions: controller.questions.length,
                                                benar: controller.correctAnswers,
                                                onRetry: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (_) => const TebakHurufGame()),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        });
                                      }
                                    }
                                  : null,
                              child: const Text(
                                'Lanjut',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _speak(String text, FlutterTts tts) async {
    await tts.setLanguage("ar");
    await tts.setPitch(1.0);
    await tts.speak(text);
  }

  Widget _buildOption(
    BuildContext context,
    TebakHurufViewmodel controller,
    String option, {
    required int index,
    double? maxWidth,
  }) {
    final bool isAnswered = controller.isAnswered;
    final String correctAnswer = controller.currentQuestion.correctAnswer;
    final String? selected = controller.selectedAnswer;

    Color bgColor = const Color.fromRGBO(224, 224, 224, 1);

    if (isAnswered) {
      if (option == correctAnswer) {
        bgColor = const Color.fromRGBO(90, 193, 120, 1);
      } else if (option == selected) {
        bgColor = const Color.fromRGBO(242, 125, 125, 1);
      }
    }

    return SizedBox(
      width: maxWidth,
      height: 100,
      child: GestureDetector(
        onTap: isAnswered
            ? null
            : () {
                controller.answer(option);
              },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [

              Positioned(
                top: 8,
                left: 12,
                child: Text(
                  '${String.fromCharCode(65 + index)}.',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Center(
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: isArabic(option) ? 40 : 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
