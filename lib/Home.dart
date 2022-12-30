import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  TextEditingController _controllerEmail = TextEditingController(text: "samuel@gmail.com");
  TextEditingController _controllerSenha = TextEditingController(text: "12345678");
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsZap2"),
        backgroundColor: Color(0xff075E54),
      ),
      body: Container()
    );
  }
}