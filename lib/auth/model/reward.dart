
class Reward {


  final String reward;
  final int mark;


  Reward(this.reward, this.mark);

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      map['reward'],
      map['mark'],
    );
  }

  @override
  String toString() {
    return 'Reward{reward: $reward, mark: $mark}';
  }
}