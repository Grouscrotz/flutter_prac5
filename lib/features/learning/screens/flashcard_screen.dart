import 'package:flutter/material.dart';
import 'package:prac5/models/topic.dart';
import 'package:prac5/models/word.dart';
import 'package:prac5/features/learning/widgets/word_card.dart';

class FlashCardScreen extends StatefulWidget {
  final Topic topic;
  final bool learningNew;
  const FlashCardScreen({super.key, required this.topic, required this.learningNew});

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  late List<Word> wordsToLearn;
  int currentIndex = 0;
  bool showTranslation = false;

  @override
  Widget build(BuildContext context) {
    if (wordsToLearn.isEmpty) return _buildEmptyState();
    final word = wordsToLearn[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Карточки: ${widget.topic.name}')),
      body: Center(
        child: WordCard(
          word: word,
          showTranslation: showTranslation,
          onShowTranslation: () => setState(() => showTranslation = true),
          onShowAgain: _showAgain,
          onRemembered: () => _moveToNextWord(remembered: true),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    wordsToLearn = widget.learningNew
        ? widget.topic.words.where((w) => !w.learned).toList()
        : widget.topic.words.where((w) => w.learned).toList();
  }

  void _moveToNextWord({bool remembered = false}) {
    setState(() {
      if (remembered) wordsToLearn[currentIndex].learned = true;

      showTranslation = false;

      if (wordsToLearn.isEmpty) return;

      if (remembered || !remembered) {
        currentIndex = (currentIndex + 1) % wordsToLearn.length;
      }

      if (currentIndex == 0 && remembered) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Слова закончились!')));
      }
    });
  }

  void _showAgain() {
    setState(() {
      final word = wordsToLearn.removeAt(currentIndex);
      wordsToLearn.add(word);
      currentIndex = currentIndex % wordsToLearn.length;
      showTranslation = false;
    });
  }

  Widget _buildEmptyState() {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточки')),
      body: const Center(child: Text('Нет слов для изучения')),
    );
  }
}

