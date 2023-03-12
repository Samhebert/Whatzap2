import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatzap/Login.dart';
import 'package:whatzap/telas/AbaContatos.dart';
import 'package:whatzap/telas/AbaConversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _emailUsuario = "";
  List<String> itensMenu = ["Configurações", "Deslogar"];

  Future _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    setState(() {
      _emailUsuario = FirebaseAuth.instance.currentUser!.email!;
    });
  }

  @override
  void initState() {
    _recuperarDadosUsuario();
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        print("Configurações");
        break;
      case "Deslogar":
        _deslogaUsuario();
        break;
    }
  }
  _deslogaUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          bottom: TabBar(
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Conversas",
              ),
              Tab(
                text: "Contatos",
              )
            ],
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context) {
                return itensMenu.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            )
          ]),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[AbaConversas(), AbaContatos()],
      ),
    );
  }
}
