import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzap2/Telas/AbaContatos.dart';
import 'package:whatzap2/Telas/abaConversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<String>itensMenu = ["Configuracoes", "Deslogar"];
  String _emailUsuario = '';

  Future _recuperarDadosUsuaros() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      _emailUsuario = FirebaseAuth.instance.currentUser!.email!;
    });
  }

  _escolhaMenuItem(String itemEscolhido){

    return "Item Escolhido :" + itemEscolhido;
  }

  @override
  void initState() {
    super.initState();

    _recuperarDadosUsuaros();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WhatsZap2"),
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              tabs: [Tab(text: "Coversas"), Tab(text: "Contatos")]),
          backgroundColor: Color(0xff075E54),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context){
                  return itensMenu.map((String item){
                    return PopupMenuItem<String>(
                      value: item,
                      child: Text(item)
                    );
                  }).toList();
              },
            )
          ]
        ),
        body: TabBarView(
            controller: _tabController,
            children: <Widget>[AbaConversas(), AbaContatos()]));
  }
}
