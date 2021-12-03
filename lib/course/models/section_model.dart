class Section {
  //номер раздела
  final String numberSection;
  //название раздела
  final String nameSection;
  //что внутри раздела ()
  final String insideSection;
  //статус завершенности раздела
  final bool completed;

  Section({
    required this.numberSection,
    required this.nameSection,
    required this.insideSection,
    required this.completed,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
        completed: map['completed'],
        insideSection: map['insideSection'],
        nameSection:  map['nameSection'],
        numberSection:  map['numberSection'],
    );
  }

  static List<Section> fromMaps(List maps) {
    return maps
        .cast<Map<String, dynamic>>()
        .map((map) => Section.fromMap(map))
        .toList() as List<Section>;
  }

}