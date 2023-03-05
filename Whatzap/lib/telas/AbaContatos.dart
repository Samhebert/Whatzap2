import 'package:flutter/material.dart';
import '../model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversas = [
    Conversa("Ana Clara", "Olá tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatzap-48a4c.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=2a3ab086-897b-4223-84a5-31c0f47ac0c8"),
    Conversa("Pedro Silva", "Me manda o nome daquela série que falamos!",
        "https://firebasestorage.googleapis.com/v0/b/whatzap-48a4c.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=d6d8c3cf-c768-45c2-ad16-45f746c8c9b7"),
    Conversa("Marcela Almeida", "Vamos sair hoje?",
        "https://firebasestorage.googleapis.com/v0/b/whatzap-48a4c.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=32c91cf3-4031-476b-890e-77fddb2bb759"),
    Conversa("José Renato", "Não vai acreditar no que tenho para te contar...",
        "https://firebasestorage.googleapis.com/v0/b/whatzap-48a4c.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=8d8a799e-de16-4e36-a8be-16cf2b985913"),
    Conversa("Jamilton Damasceno", "Curso novo!! depois dá uma olhada!!",
        "https://firebasestorage.googleapis.com/v0/b/whatzap-48a4c.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=c9c0db92-802b-480b-84cd-bdae00df18fd"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice) {
          Conversa conversa = listaConversas[indice];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(conversa.caminhoFoto),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          );
        });
  }
}
