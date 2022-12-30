import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzap2/Cadastro.dart';
import 'package:whatzap2/model/Usuario.dart';

import 'Home.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

      if (email.isNotEmpty  && email.contains("@")) {
        if (senha.isNotEmpty) {
          Usuario usuario = Usuario();

          usuario.email = email;
          usuario.senha = senha;

          _logarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha!";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o E-mail utilizando @";
        });
      }
  }

  _logarUsuario(Usuario usuario){

    FirebaseAuth auth = FirebaseAuth.instance; 
    auth.signInWithEmailAndPassword(email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error){
      setState((){
        _mensagemErro = 'Erro Ao Fazer Login Por Favor Verifique Suas Credenciais E Tente Novamente!';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color(0xff075E54)),
            padding: EdgeInsets.all(16),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    "imagens/logo.png",
                    width: 200,
                    height: 150,
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "E-mail",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))))),
              TextField(
                controller: _controllerSenha,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)))),
              Padding(
                  padding: EdgeInsets.fromLTRB(7, 10, 7, 16),
                  child: ElevatedButton(
                    child:
                        Text("Entrar", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                            ),

                        ),
                        minimumSize: MaterialStateProperty.all(Size(55,55))
                    ),
                    onPressed: () {
                      _validarCampos();
                    },
                  )),
                          Center(
                            child: GestureDetector(
                              child: Text("Não tem conta ?, Cadastra-se",
                              style: TextStyle(
                                color: Colors.white
                              )
                            ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Cadastro()
                                ));
                              }
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : 16),
                            child:  Center(
                              child: Text(
                                _mensagemErro,
                                style: TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ),
                          )
            ])))));
  }
}
