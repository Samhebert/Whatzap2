import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  TextEditingController _controllerNome = TextEditingController(text: "");
  PickedFile? _imagemPicked;
  XFile? _imagem;
  String _idUsuarioLogado = "";
  bool _subindoImage = false;
  String _imagemUrlRecuperada = "";
  Future? _recuperarImage(String origemImagem) async {
    switch (origemImagem) {
      case "camera":
        XFile? file =
            await ImagePicker.platform.getImage(source: ImageSource.camera);
        _imagem = file;
        break;
      case "galeria":
        XFile? file =
            await ImagePicker.platform.getImage(source: ImageSource.gallery);
        _imagem = file;
        break;
    }

    setState(() {
      //_imagemPicked = imagemSelecionada;

      if (_imagem != null) {
        _subindoImage = true;
        _uploadImagem();
      }
    });
  }

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo =
        pastaRaiz.child("perfil").child(_idUsuarioLogado + ".jpg");

    UploadTask task = arquivo.putFile(File(_imagem!.path));

    task.snapshotEvents.listen((TaskSnapshot storageEvent) {
      if (storageEvent.state == TaskState.running) {
        setState(() {
          _subindoImage = true;
        });
      } else if (storageEvent.state == TaskState.success) {
        _subindoImage = false;
      }
    });

    task.then((TaskSnapshot) => null);

    task.then((TaskSnapshot taskSnapshot) => _recuperarUrlImagem(taskSnapshot));
  }

  Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {
    String url = await taskSnapshot.ref.getDownloadURL();
    _atualizarUrlImagemFirestore(url);
    setState(() {
      _imagemUrlRecuperada = url;
    });
  }

  _atualizarUrlImagemFirestore(String url) {
    Map<String, dynamic> dadosAtualizar = {"urlImagem": url};

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Usuarios").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  _recuperaDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado!.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc(_idUsuarioLogado).get();
    var dados = snapshot.data();
  _controllerNome.text = "${(dados as dynamic)["nome"]}";

    if(dados != null){
      _imagemUrlRecuperada = "${(dados as dynamic)["urlImagem"]}";
    }
  }

  @override
  void initState() {
    super.initState();
    _recuperaDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
              _subindoImage ? CircularProgressIndicator() : Container(),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey,
                backgroundImage: _imagemUrlRecuperada != null
                    ? NetworkImage(_imagemUrlRecuperada)
                    : null,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('Camera'),
                      onPressed: () {
                        _recuperarImage("camera");
                      },
                    ),
                    ElevatedButton(
                      child: Text('Galeria'),
                      onPressed: () {
                        _recuperarImage("galeria");
                      },
                    )
                  ]),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerNome,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      )),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: ElevatedButton(
                  child: Text("Salva", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(55, 55))),
                  onPressed: () {},
                ),
              )
            ])))));
  }
}
