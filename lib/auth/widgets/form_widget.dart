import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

//текстовое поле для экрана авторизации (логин/пароль)
class TextFormFieldForAuthPage extends StatefulWidget{

  TextEditingController controller;
  //заголовок поля
  final String label;
  //иконка в левой части поля
  Icon icon;
  //скрыть ли вводимой символы
  bool obscureText;
  //есть ли кнопка которая скрывает и раскрывает вводимые символы
  bool isEye;

  TextFormFieldForAuthPage({
    required this.label,
    this.icon = const Icon(CupertinoIcons.mail,color: blackTextPSB,size: 21,),
    required this.controller,
    this.obscureText = false,
    this.isEye = false,
  });

  @override
  State<TextFormFieldForAuthPage> createState() => _TextFormFieldForAuthPageState();
}

class _TextFormFieldForAuthPageState extends State<TextFormFieldForAuthPage> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: blackTextPSB,
          fontFamily: 'Gilroy',
          fontSize: 14
      ),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon: widget.isEye ? IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            widget.obscureText
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
        ) : null,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: lightBlackTextPSB,
            fontFamily: 'Gilroy',
            fontSize: 14
        ),
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEFEFEF), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEFEFEF), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEFEFEF), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEFEFEF), width: 1.0),
        ),
      ),
    );
  }
}