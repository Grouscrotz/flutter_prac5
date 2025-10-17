class Word {
  final String word;
  final String translation;
  bool learned;

  Word({required this.word, required this.translation, this.learned = false});
}