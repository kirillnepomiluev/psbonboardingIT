import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

import 'all_widgets.dart';

class SearchInput extends StatefulWidget {
  //контроллер поиска
  final TextEditingController controller;
  //фокус на поле ввода
  final FocusNode? focusNode;// nullable
  // заголовок
  final String label;
  //высота поисковой строки
  double height;
  // проверка на белый цвет
  final bool searchFocusColorWhite;

  SearchInput({
    required this.controller,
    this.focusNode,
    required this.label,
    this.height = 48,
    this.searchFocusColorWhite = false,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    //разделение посиковой строки для веб/app
    return _buildApp(context);
  }

  Color bgColor = Colors.white;
  Color bgColor2 = Colors.white;
  Color lineColor = Colors.grey;
  Color lineColor2 = Colors.grey;

  //поисковая строка в вебе
  Widget _buildWeb(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      height: 70,
      // width: MediaQuery.of(context).size.width * 1,
      child: Focus(
        onFocusChange: (focusNode) {
          if (focusNode) {
            setState(() {
              bgColor = widget.searchFocusColorWhite == false ? Colors.blue : Colors.white;
              lineColor = widget.searchFocusColorWhite == false ? Colors.white : Colors.grey;
            });
          } else {
            setState(() {
              bgColor = Colors.white;
              lineColor = Colors.grey;
            });
          }
        },
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.70,
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF336AF6).withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 9,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          height: 70,
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: TextStyle(color: widget.searchFocusColorWhite == false ? Colors.white : Colors.grey,fontWeight: FontWeight.w400,fontSize: 15),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.searchFocusColorWhite == false ? Colors.white : Colors.grey),
              ),
              focusColor: Colors.blue,
              labelText: widget.label,
              labelStyle: TextStyle(color: lineColor),
              prefixIcon: Icon(Icons.search, color: lineColor),
            ),
          ),
        ),
      ),
    );
  }
  //поисковая строка в мобильном приложении
  Widget _buildApp(BuildContext context){
    return Container(
      height: widget.height == 0 ? null : widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: arrowRightPSB.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(0, 5)
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldFilter(
                context,
                const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                hinttext: widget.label,
                controller: widget.controller,
                focusNode: widget.focusNode,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Icon(
              Icons.search,
              size: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

