import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/profile/widgets/prize_profile_box.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_app_digital_finals/widgets/buttons.dart';

List<Map<String, dynamic>> prizes = [
  {
    'imagePrize': 'assets/prizeOne.png',
    'namePrize': 'Старательный ученик',
    'textBodyPrize': 'Завершил половину курса',
  },
];

//экран профиля
class ProfilePage extends StatefulWidget {
  //имя профиля
  final String? name;
  //должность профиля
  final String? position;

  ProfilePage({
    Key? key,
    this.name = 'Ольга Луценко',
    this.position = 'Product Designer',
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: _body(context), bottomNavigationActiveItem: AppBottomNavigationItem.profile);
  }

  Widget _body(BuildContext context){
    return Column(
      children: [
        _appbar(),
        Expanded(child: _bodyBottom()),
      ],
    );
  }

  //апп бар
  Widget _appbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: arrowRightPSB.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 8
          ),
        ],
      ),
      child: Column(
        children: [
          //строчка с фото
          _rowPhoto(),
          Container(height: 20,),
          Text(widget.name!,style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Gilroy',fontSize: 24,color: blackTextPSB),),
          Text(widget.position!,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),),
          Container(height: 20,),
          //строчка со статистикой
          _rowStatistics(),
          Container(height: 20,),
          //строчка с кнопками
          _rowButton(),
          Container(height: 20,),
        ],
      ),
    );
  }

  //строчка с фото
  Widget _rowPhoto(){
    return Row(
      children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded,color: blackTextPSB,size: 23,)),
        const Spacer(),
        SizedBox(width: 100,height: 100,child: Image.asset('assets/imageMyContactPhoto.png',fit: BoxFit.fill,)),
        const Spacer(),
        IconButton(onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, "/LoginScreen");
        }, icon: const Icon(Icons.exit_to_app,color: lightBlackTextPSB,size: 23,))
      ],
    );
  }

  //строчка со статистикой
  Widget _rowStatistics(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statisticsBox(),
        _statisticsBox(color: const Color(0xFF50A8FF),countBal: '4',lable: 'курса',icon: const Icon(CupertinoIcons.book,color: Color(0xFF50A8FF),size: 26,)),
        _statisticsBox(color: const Color(0xFF4DC591),countBal: '50',lable: 'уроков',icon: const Icon(Icons.star_border,color: Color(0xFF4DC591),size: 26,)),
    ],);
  }

  //котейнер со статистикой
  Widget _statisticsBox({Color color = const Color(0xFFFF7648),String countBal = '50',String lable = 'баллов',Icon icon = const Icon(Icons.star_border,color: orangePSB,size: 26,)}){
    return Container(
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.1),
            ),
            child: Center(child: icon,),
          ),
          Container(height: 8,),
          Text(countBal,style: const TextStyle(color: blackTextPSB,fontSize: 20,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Container(height: 8,),
          Text(lable,style: const TextStyle(color: lightBlackTextPSB,fontSize: 14,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  //строчка с кнопками
  Widget _rowButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: MediaQuery.of(context).size.width * 0.4,child: bigButton(onPressed: (){},text: 'Мои курсы'),),
        Container(width: MediaQuery.of(context).size.width * 0.4,child: bigButtonOrangeBorder(onPressed: (){},text: 'Продолжить')),
      ],
    );
  }

  //список призов
  Widget _bodyBottom(){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: prizes.length,
        itemBuilder: (ctx, item){
          return Column(
            children: [
              PrizeCard(
                imagePrize: prizes[item]['imagePrize'],
                namePrize: prizes[item]['namePrize'],
                textBodyPrize: prizes[item]['textBodyPrize'],
              ),
              Container(height: 15,)
            ],
          );
        }),
    );
  }

}
