import 'dart:html';

import 'package:flutter/material.dart';

import '../model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversa = [
    Conversa("Ana Clara", "Olá Tudo Bem ?",
        "https://firebasestorage.googleapis.com/v0/b/whatzap2-87ec8.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=4af37c86-f53b-4907-a8c1-faef6b295782"),
    Conversa("Pedro Silva", "Me manda o nome daquela serie que falamos?",
        "https://firebasestorage.googleapis.com/v0/b/whatzap2-87ec8.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=d2b6ec46-832e-4db9-ac91-809304f19eec"),
    Conversa("Marcela Almeida", "Olá Tudo Bem ?",
        "https://firebasestorage.googleapis.com/v0/b/whatzap2-87ec8.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=efc6d7a3-4fbe-4e72-9909-0795ee8db996"),
    Conversa(
        "José Renato",
        "Quade o dinheiro, tenho que da o dinheiro pros cara amanha",
        "https://firebasestorage.googleapis.com/v0/b/whatzap2-87ec8.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=f1aa5b89-4db9-4776-b3ed-b5121625f2ed"),
    Conversa("Jamilto Damasceno", "Tem curso novo, depois da uma olhada",
        "https://firebasestorage.googleapis.com/v0/b/whatzap2-87ec8.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=10fcf3c7-f6b5-49c4-9b08-c5bec5346930")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversa.length,
        itemBuilder: (context, indice) {
          Conversa conversa = listaConversa[indice];
          return ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey,
               //ß backgroundImage: NetworkImage(conversa.caminhoFoto),
              ),
              title: Text(conversa.nome,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)));
        });
  }
}
