import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';


class CreateReviewFloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: orangePSB,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(13.0),
          child: Icon(
            Icons.message,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
