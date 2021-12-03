
class Reward {

  final String name;
  final String description;
  final String imageUrl;
  final String reward;
  final String rewardImageUrl;


  Reward(this.name, this.description, this.imageUrl, this.reward,
      this.rewardImageUrl);

  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      map['name'],
      map['description'],
      map['imageUrl'],
      map['reward'],
      map['rewardImageUrl'],
    );
  }

  @override
  String toString() {
    return 'Reward{name: $name, description: $description, imageUrl: $imageUrl, reward: $reward, rewardImageUrl: $rewardImageUrl}';
  }
}