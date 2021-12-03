
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class ChatCard extends StatelessWidget {
  //фото контакта
  final String imageContact;
  //имя контакта
  final String nameContact;
  //должность контакта
  final String positionContact;
  //время последнего сообщения
  final String timeLastMessage;

  //есть ли бордер
  final bool border; //nullable

  ChatCard({
    required this.imageContact,
    required this.nameContact,
    required this.positionContact,
    required this.timeLastMessage,
    this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.white,
      child: Column(
        children: [
          border ? Container() : const Divider(height: 1),
          Container(
            decoration: BoxDecoration(border: border ? Border.all(color: const Color(0xFFEFF2F5),width: 2) : null,borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50 / 2,
                    backgroundImage: Image.asset(imageContact).image,
                  ),
                ),
                Container(width: 12),
                Expanded(
                  child: _nameAndPosition(),
                ),
                Container(width: 10),
                Text(timeLastMessage,style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Gilroy',fontSize: 10,color: blackTextPSB)),
              ],
            ),
          ),
          Container(height: 15),
        ],
      ),
    );
  }

  //центральная часть с именем и должностью
  Widget _nameAndPosition(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nameContact,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB),),
          Text(
            positionContact,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),
          ),
        ],
      ),
    );
  }

  //действие при нажатии на контакт
  void _onTap(BuildContext context, String anotherUserId) {
    // ChatPage.show(context, anotherUserId);
  }

}
