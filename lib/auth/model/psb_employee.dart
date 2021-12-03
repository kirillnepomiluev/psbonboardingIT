
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_digital_finals/main.dart';
// модель пользователя
class PsbEmployee  {

 final  String id;
 final   String name;
 final  String group; //тип пользователя
 final String position; // должность

  PsbEmployee({this.id = "no", this.name = "no", this.group ="EMPLOYEE", this.position = ""});

  factory PsbEmployee.fromMap(Map<String, dynamic> map) {
    return PsbEmployee(
      id: map['id'].toString(),
      name: map['name'].toString(),
      group: map['group'].toString(), //!!!!
      position:  map['position'].toString(),
    );
  }
}
 const List<String> EmployeeGroups = ["EMPLOYEE", "LEAD", "MENTOR"];

class PsbEmployeeModelView  with ChangeNotifier  {
  PsbEmployee _psbEmployee = PsbEmployee();

  PsbEmployee get psbEmployee => _psbEmployee;
  PsbEmployeeModelView() {
    isAuth = FirebaseAuth.instance.currentUser !=null;
    if (isAuth) {
      this.getPsbEmployeeFromFirebase(FirebaseAuth.instance.currentUser!.uid);
    }
  }
  set psbEmployee(PsbEmployee psbEmployee) {
    _psbEmployee = psbEmployee;
    notifyListeners();
  }

  getPsbEmployeeFromFirebase (String id) async {
    DocumentSnapshot doc = await  store.collection("users").doc(id).get();
   _psbEmployee = PsbEmployee.fromMap(doc.data() as Map<String, dynamic>);
    notifyListeners();
  }
}


class AuthModelView with ChangeNotifier {
  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

}
AuthModelView initeAuth() {
  AuthModelView authModelView = AuthModelView();
  FirebaseAuth.instance.userChanges().listen((event) {
    authModelView._user = event;
    isAuth = event!=null;
    if (isAuth) {

    }
  });
  return authModelView;
}