class Tipo{
  int? _id;
  String? _nome;
  String? _descricao;
  Tipo({int? id, String? nome, String? descricao}){
    _id = id;
    _nome = nome;
    _descricao = descricao;
  }
  int? get id => _id;
  String? get nome => _nome;
  String? get descricao => _descricao;

  set descricao(String? value) => _descricao = value;
  set nome(String? value) => _nome = value;
  set id(int? value) => _id = value;

}