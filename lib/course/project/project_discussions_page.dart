import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/models/reviews_model.dart';
import 'package:flutter_app_digital_finals/course/project/widgets/create_review_float_button.dart';
import 'package:flutter_app_digital_finals/course/project/widgets/project_discussions_box.dart';

//экран отображающий обсуждения в проекте
class ProjectDiscussionsPage extends StatelessWidget{
  final List<Reviews>? reviews;

  ProjectDiscussionsPage({
    this.reviews
  });

  @override
  Widget build(BuildContext context) {
    if (reviews == null) return Container(child: Text('Пока нет ниодного отзыва'),);

    return Scaffold(
      floatingActionButton: CreateReviewFloatingButton(),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: reviews!.length,
          itemBuilder: (ctx, item) {
            return BoxReview(
              reviews: reviews![item],
            );
          }),
    );
  }

}