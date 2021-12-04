import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

//вииджет для главной страницы (заголовок разделов моикурсы/мои награды)
Widget appTitle({
  String title = 'Ваши курсы',
}) {
  return Row(
    children: [
      Expanded(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            color: blackTextPSB),
      )),
      TextButton(
        onPressed: () {},
        child: const Text(
          'Все',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
              color: blueTextPSB),
        ),
      ),
      const Icon(
        Icons.arrow_forward_ios_outlined,
        color: arrowRightPSB,
        size: 16,
      ),
    ],
  );
}

//виджет текстового поля (для поисковой строки)
Widget TextFieldFilter(BuildContext context, BoxDecoration decoration,
    {String? hinttext,
    TextEditingController? controller,
    FocusNode? focusNode, // nullable
    int minl = 1,
    int maxl = 1}) {
  return Container(
    padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
    decoration: decoration,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hinttext!,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Colors.grey)),
          TextField(
            minLines: minl,
            maxLines: maxl,
            controller: controller,
            focusNode: focusNode,
            //textAlign: TextAlign.start,
            //textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xffc5c5c5)),
            decoration: const InputDecoration(
              isDense: true,
              //contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    ),
  );
}
