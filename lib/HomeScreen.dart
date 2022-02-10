import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final name;
  final username;
  const HomeScreen({ this.name,this.username});

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
              Text("LoggedIn Sucessfully",style: TextStyle(fontSize: 25,color: Colors.green),),
              SizedBox(height: 12,),
              Text("Name: $name",style: TextStyle(fontSize: 18,color: Colors.grey,),),
              Text("username: $username",style: TextStyle(fontSize: 18,color: Colors.grey,),),
              
              ],  
            ),
          ),
        ),
      ),
    );
  }
}