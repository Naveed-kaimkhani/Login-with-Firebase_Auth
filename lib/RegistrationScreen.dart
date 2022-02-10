import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_user_login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailcontroll=TextEditingController();
  TextEditingController _passcontroll=TextEditingController();
  TextEditingController _usercontroll=TextEditingController();
  TextEditingController _urlcontroll=TextEditingController();
 
  Future<bool> registerUser(String email,String pass,String user) async{
  //  print(email);
    FirebaseAuth auth=FirebaseAuth.instance;
    FirebaseFirestore db=FirebaseFirestore.instance;

   try {
   final UserCredential User= await auth.createUserWithEmailAndPassword(email: email, password: pass);
    db.collection("Users").doc(User.user!.uid).set(
      {
        "email":email,
          "username":user
      }
    );
    print("user registered");
    return true;
   } catch (e) {
     print(e);
    return false;
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text("SignUp",style: TextStyle(fontSize: 30,color: Colors.green),),
              SizedBox(height: 12,),
  TextFormField(
    controller: _emailcontroll,
    decoration: InputDecoration(
    icon: Icon(Icons.person),
    hintText: 'Enter Your Email',
    labelText: 'Email',
  ),
   
              ),
              SizedBox(height: 12,),
  TextFormField(
    controller: _passcontroll,
    decoration: InputDecoration(
    icon: Icon(Icons.password_outlined),
    hintText: 'Enter Your password',
    labelText: 'Password',
  )),
           SizedBox(height: 12,),
  TextFormField(
    controller: _usercontroll,
    decoration: InputDecoration(
    icon: Icon(Icons.text_fields),
    hintText: 'Enter UserName Name',
    labelText: 'UserName',
  )),

  SizedBox(height: 12,),
  TextFormField(
    controller: _urlcontroll,
    decoration: InputDecoration(
    icon: Icon(Icons.text_fields),
    hintText: 'Enter PhotoUrl',
    labelText: 'photoUrl',
  )),
  SizedBox(height: 20,),
  
  ElevatedButton(
    onPressed:() async {
      final e=_emailcontroll.text;
      final p=_passcontroll.text;
      final u=_usercontroll.text;
      //print("$e $p");
      //print(e);
      bool result=await registerUser(e, p,u);
  if (result) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context)=>LoginScreen()
      ));
      
  }
  else{
    print("Error");
  }
    } , child: Text("SignUp"))
            ],  
            ),
          ),
        ),
      ),
    );
  }
}