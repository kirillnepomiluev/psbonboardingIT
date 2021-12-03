import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//список уроков (база)
List<Map<String, dynamic>> lessons = [
  {
    "number" : '01',
    "durationLesson" : 'Видео 01:48',
    "nameLesson" : 'Вступление',
  },
  {
    "number" : '02',
    "durationLesson" : 'Аудио 10:00',
    "nameLesson" : 'О ПСБ',
  },
  {
    "number" : '03',
    "durationLesson" : 'Лонгрид 05:00',
    "nameLesson" : 'Документы',
  },
  {
    "number" : '04',
    "durationLesson" : 'Тест 05:00',
    "nameLesson" : 'Первый блок',
  },
];

//список менторов (база)
List<Map<String, dynamic>> mentors = [
  {
    "imageMentor" : 'assets/mentor1.png',
    "nameMentor" : 'Петров Григорий',
    "positionMentor" : 'Руководитель',
  },
  {
    "imageMentor" : 'assets/mentor2.png',
    "nameMentor" : 'Лапенко Евгений',
    "positionMentor" : 'Куратор',
  },
];
//список параметров (ожидание от курса)
List<Map<String, dynamic>> awaitCourse = [
  {
    "icon" : Icon(CupertinoIcons.book),
    "text" : '25 уроков',
  },
  {
    "icon" : Icon(Icons.screen_rotation_outlined),
    "text" : 'Приложение и веб',
  },
  {
    "icon" : Icon(Icons.show_chart),
    "text" : 'Помощь в адаптации',
  },
  {
    "icon" : Icon(CupertinoIcons.headphones),
    "text" : 'Тексты, аудио, видео',
  },
  {
    "icon" : Icon(Icons.all_inclusive),
    "text" : 'Доступ навсегда',
  },
  {
    "icon" : Icon(Icons.wrap_text_outlined),
    "text" : 'Тестирование',
  },    {
    "icon" : Icon(CupertinoIcons.star),
    "text" : 'Награждение',
  },
];

//для контейнера с рейтингом
List<Map<String, dynamic>> rating = [
  {
    "percent" : '0.5',
    "intStar" : 5,
  },
  {
    "percent" : '0.7',
    "intStar" : 4,
  },
  {
    "percent" : '0.4',
    "intStar" : 3,
  },
  {
    "percent" : '0.2',
    "intStar" : 2,
  },
  {
    "percent" : '0.1',
    "intStar" : 1,
  },

];
//список FAQ
List<Map<String, dynamic>> faq = [
  {
    "text" : 'К кому обращаться за помощью?',
  },
  {
    "text" : 'Не успеваю проходить курс',
  },
  {
    "text" : 'Не могу найти информацию',
  },
  {
    "text" : 'Информация не соответствует',
  },
];