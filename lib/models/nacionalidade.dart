class Nacionalidade{

  int? _id;
  String? _nome;
  String? _descricao;

  Nacionalidade({int? id, String? nome,String? descricao}){
    _id = id;
    _nome = nome;
    _descricao = descricao;
  }

  int? get id => _id;
  String? get nome => _nome;
  String? get descricao => _descricao;

  set id(int? value) => _id = value;
  set nome(String? value) => _nome = value;
  set descricao(String? value) => _descricao = value;
}
