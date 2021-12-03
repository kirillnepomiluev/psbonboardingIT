import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/course/models/reviews_model.dart';
import 'package:flutter_app_digital_finals/course/models/section_model.dart';

class Project {
  //название курса/проекта
  final String projectName;
  //тип проекта
  final String projectType;
  //цели и задачи проекта
  final String projectGoals;
  //мероприятия проекта (html-текст)
  final String projectActivities;
  //план работ и контрольные точки
  final Map<String, dynamic> projectPlan;
  //результаты проекта
  final String projectResult;
  //Команда проекта
  final List<dynamic> projectTeam;
  // инструменты, ключ - название, значение - ссылка (если есть)
  Map<String, dynamic> tools;



  Project(
      this.projectName,
      this.projectType,
      this.projectGoals,
      this.projectActivities,
      this.projectPlan,
      this.projectResult,
      this.projectTeam,
      this.tools);

  factory Project.fromMap(Map<String, dynamic> snapshot) {
    return Project(
      snapshot['projectName'],
      snapshot['projectType'],
      snapshot['projectGoals'],
      snapshot['projectActivities'],
      snapshot['projectPlan'],
      snapshot['projectResult'],
      snapshot['projectTeam'],
      snapshot['tools'],
    );
  }

  static List<Project> fromMaps(List maps) {
    return maps
        .cast<Map<String, dynamic>>()
        .map((map) => Project.fromMap(map))
        .toList() as List<Project>;
  }

  @override
  String toString() {
    return 'Project{projectName: $projectName, projectType: $projectType, projectGoals: $projectGoals, projectActivities: $projectActivities, projectPlan: $projectPlan, projectResult: $projectResult, projectTeam: $projectTeam, tools: $tools}';
  }
}