import "package:flutter/material.dart";

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cadastro")),
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
                        "imagens/usuario.png",
                        width: 200,
                        height: 150,
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(32, 16, 32, 16),
                              hintText: "Nome",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32))))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(32, 16, 32, 16),
                              hintText: "E-mail",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32))))),
                  TextField(
                      autofocus: true,
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
                        child: Text("Cadastra",
                            style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(55, 55))),
                        onPressed: () {},
                      )),
                ])))));
  }
}
