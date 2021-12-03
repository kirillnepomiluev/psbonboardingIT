
class GuideElement {
  final   String name;
  final  String link; //тип пользователя

  GuideElement(this.name, this.link);

  factory GuideElement.fromMap(Map<String, dynamic> map) {
    return GuideElement(
      map['name'],
      map['link'],
    );
  }

  @override
  String toString() {
    return 'GuideElement{name: $name, link: $link}';
  }
}
