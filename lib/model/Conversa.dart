class Conversa {
  late String _nome;
  late String _mensaem;
  late String _caminhoFoto;


  Conversa(this._nome, this._mensaem, this._caminhoFoto);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get mensaem => _mensaem;

  String get caminhoFoto => _caminhoFoto;

  set caminhoFoto(String value) {
    _caminhoFoto = value;
  }

  set mensaem(String value) {
    _mensaem = value;
  }
}
