
class Reward {

  final String imageUrl;
  final String reward;
  final int mark;


  Reward(this.imageUrl, this.reward, this.mark);

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      map['reward'],
      map['imageUrl'],
      map['mark'],
    );
  }

  @override
  String toString() {
    return 'Reward{imageUrl: $imageUrl, reward: $reward, mark: $mark}';
  }
}