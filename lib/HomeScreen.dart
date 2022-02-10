import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final name;
  final imageUrl;
  const HomeScreen({ this.name,this.imageUrl});

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
              Text("ImageUrl: $imageUrl",style: TextStyle(fontSize: 18,color: Colors.grey,),),
              
              ],  
            ),
          ),
        ),
      ),
    );
  }
}