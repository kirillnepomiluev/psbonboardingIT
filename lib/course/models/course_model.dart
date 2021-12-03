
import 'package:flutter_app_digital_finals/course/models/reviews_model.dart';
import 'package:flutter_app_digital_finals/course/models/section_model.dart';

class Course {

  //название курса
  final String projectName;
  //название секции к которой данный курс/проект относится
   final String nameSection;
  //имя куратора
  final String curatorName;
  //продолжительность курса/раздела
  final String? timeProject; //nullable
  //описание курса/раздела
  final String? descriptionProject; //nullable
  //рейтинг курса/раздела
  final String ratingProject;
  //рейтинг куратора
  final String progress;
  //рейтинг куратора
  final String ratingCurator;
  //список отзывов (раздел обсуждения)
  final List<Reviews> listReviews;
  //список разделов для данного курса/проекта
  final List<Section> listSection;


   Course(
       this.projectName,
      this.nameSection,
      this.curatorName,
      this.timeProject,
      this.descriptionProject,
      this.ratingProject,
      this.progress,
      this.ratingCurator,
       this.listReviews,
      this.listSection);

  factory Course.fromMap(Map<String, dynamic> snapshot) {
     return Course(
       snapshot['projectName'],
       snapshot['nameSection'],
       snapshot['curatorName'],
       snapshot['progress'],
       snapshot['timeProject'],
       snapshot['descriptionProject'],
       snapshot['ratingProject'],
       snapshot['ratingCurator'],
       Reviews.fromMaps(snapshot['listReviews']),
       Section.fromMaps(snapshot['listSection']),
     );
   }

   static List<Course> fromMaps(List maps) {
     return maps
         .cast<Map<String, dynamic>>()
         .map((map) => Course.fromMap(map))
         .toList() as List<Course>;
   }
}