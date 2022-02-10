
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_user_login/HomeScreen.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passcontroller = TextEditingController();

  Future<void> login(String email,String pass)async{
    FirebaseAuth auth=FirebaseAuth.instance;
    FirebaseFirestore db=FirebaseFirestore.instance;
    print(email);
    print(pass);

    try {
      print("in try");
      final UserCredential User=await auth.signInWithEmailAndPassword(email: email, password: pass);
      final DocumentSnapshot snapshot =  await  db.collection("users").doc(User.user!.uid).get();
      final data=snapshot.data();
      print("user loggedin");
      print(data);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(name: email,username: pass,),  )
        );
      //print(data["password"]);
      //print(data["username"]);
    } catch (e) {
      print(e);
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
              Text("SigIn",style: TextStyle(fontSize: 30,color: Colors.green),),
              SizedBox(height: 12,),
  TextFormField(
    controller: _emailcontroller,
    decoration: InputDecoration(
    icon: Icon(Icons.person),
    hintText: 'Enter Your Email',
    labelText: 'Email',
  ),
   
              ),
              SizedBox(height: 12,),
  TextFormField(
    controller: _passcontroller,
    decoration: InputDecoration(
      
    icon: Icon(Icons.password_outlined),
    hintText: 'Enter Your password',
    labelText: 'Password',
  )),
        
  SizedBox(height: 20,),
  ElevatedButton(
    onPressed:(){
      String em=_emailcontroller.text;
      String ps=_passcontroller.text;
      login(em,ps);
      
    } , child: Text("SignIn"))
            ],  
            ),
          ),
        ),
      ),
    );
  }
}