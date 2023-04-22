import 'package:flutter/material.dart';
import 'package:whatzap/Cadastro.dart';
import 'package:whatzap/Configuracoes.dart';
import 'package:whatzap/Home.dart';
import 'package:whatzap/Login.dart';

class RouteGeneretor{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => Login());
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());
      case '/cadastro':
        return MaterialPageRoute(builder: (context) => Cadastro());
      case '/home':
        return MaterialPageRoute(builder: (context) => Home());
      case '/Configuracoes':
        return MaterialPageRoute(builder: (context) => Configuracoes());
      defaut:
      _erroRota();
    }
  }
  
  static Route<dynamic>? _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: Text("Tela não encontrada")),
        body: Center(
          child: Text("Tela não encontrada")
        )
      );
    });
  }
}

