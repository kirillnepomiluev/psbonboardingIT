class Reviews {
  //фото контакта
  final String imageContact;
  //имя контакта
  final String nameContact;
  //должность контакта
  final String positionContact;
  //время последнего сообщения
  final String timeLastMessage;
  // текст отзыва
  final String textReview;

  Reviews({
    required this.imageContact,
    required this.nameContact,
    required this.positionContact,
    required this.timeLastMessage,
    required this.textReview,
  });

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      imageContact: map['imageContact'],
      nameContact: map['nameContact'],
      positionContact: map['positionContact'],
      textReview: map['textReview'],
      timeLastMessage: map['timeLastMessage']
    );
  }

  static List<Reviews> fromMaps(List maps) {
    return maps
        .cast<Map<String, dynamic>>()
        .map((map) => Reviews.fromMap(map))
        .toList() as List<Reviews>;
  }

}