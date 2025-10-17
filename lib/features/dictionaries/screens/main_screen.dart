import 'package:flutter/material.dart';
import '../../../models/topic.dart';
import '../../../models/word.dart';
import '../../learning/screens/learning_screen.dart';
import 'dictionaries_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Topic> topics = [
    Topic(name: 'Фрукты', words: [
      Word(word: 'Apple', translation: 'Яблоко'),
      Word(word: 'Banana', translation: 'Банан'),
      Word(word: 'Cherry', translation: 'Вишня'),
      Word(word: 'Orange', translation: 'Апельсин'),
      Word(word: 'Grape', translation: 'Виноград'),
      Word(word: 'Pineapple', translation: 'Ананас'),
      Word(word: 'Mango', translation: 'Манго'),
      Word(word: 'Peach', translation: 'Персик'),
      Word(word: 'Strawberry', translation: 'Клубника'),
      Word(word: 'Lemon', translation: 'Лимон'),
    ]),
    Topic(name: 'Животные', words: [
      Word(word: 'Dog', translation: 'Собака'),
      Word(word: 'Cat', translation: 'Кошка'),
      Word(word: 'Elephant', translation: 'Слон'),
      Word(word: 'Tiger', translation: 'Тигр'),
      Word(word: 'Lion', translation: 'Лев'),
      Word(word: 'Bear', translation: 'Медведь'),
      Word(word: 'Wolf', translation: 'Волк'),
      Word(word: 'Fox', translation: 'Лиса'),
      Word(word: 'Rabbit', translation: 'Кролик'),
      Word(word: 'Horse', translation: 'Лошадь'),
    ]),
    Topic(name: 'Цвета', words: [
      Word(word: 'Red', translation: 'Красный'),
      Word(word: 'Blue', translation: 'Синий'),
      Word(word: 'Green', translation: 'Зелёный'),
      Word(word: 'Yellow', translation: 'Жёлтый'),
      Word(word: 'Black', translation: 'Чёрный'),
      Word(word: 'White', translation: 'Белый'),
      Word(word: 'Orange', translation: 'Оранжевый'),
      Word(word: 'Purple', translation: 'Фиолетовый'),
      Word(word: 'Pink', translation: 'Розовый'),
      Word(word: 'Brown', translation: 'Коричневый'),
    ]),
    Topic(name: 'Одежда', words: [
      Word(word: 'Shirt', translation: 'Рубашка'),
      Word(word: 'Pants', translation: 'Брюки'),
      Word(word: 'Shoes', translation: 'Обувь'),
      Word(word: 'Hat', translation: 'Шляпа'),
      Word(word: 'Coat', translation: 'Пальто'),
      Word(word: 'Skirt', translation: 'Юбка'),
      Word(word: 'Dress', translation: 'Платье'),
      Word(word: 'Socks', translation: 'Носки'),
      Word(word: 'Gloves', translation: 'Перчатки'),
      Word(word: 'Scarf', translation: 'Шарф'),
    ]),
    Topic(name: 'Транспорт', words: [
      Word(word: 'Car', translation: 'Машина'),
      Word(word: 'Bus', translation: 'Автобус'),
      Word(word: 'Train', translation: 'Поезд'),
      Word(word: 'Bicycle', translation: 'Велосипед'),
      Word(word: 'Plane', translation: 'Самолёт'),
      Word(word: 'Boat', translation: 'Лодка'),
      Word(word: 'Motorcycle', translation: 'Мотоцикл'),
      Word(word: 'Taxi', translation: 'Такси'),
      Word(word: 'Truck', translation: 'Грузовик'),
      Word(word: 'Subway', translation: 'Метро'),
    ]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Topic? selectedTopic = topics.any((t) => t.selected) ? topics.firstWhere((t) => t.selected) : null;

    List<Widget> screens = [
      DictionariesScreen(
        topics: topics,
        onSelectTopic: (topic) {
          setState(() {
            topics.forEach((t) => t.selected = false);
            topic.selected = true;
          });
        },
      ),
      LearningScreen(topic: selectedTopic),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Словари'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Изучение'),
        ],
      ),
    );
  }
}