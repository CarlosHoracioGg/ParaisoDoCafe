import 'tipo.dart';
import 'nacionalidade.dart';

class Produto{
  int? _id;
  String? _nome;
  String? _descricao;
  Nacionalidade? _nacionalidade;
  Tipo? _tipo;

  Cafe({int? id, String? nome, String? descricao, Nacionalidade? nacionalidade, Tipo? tipo}){
    _id = id;
    _nome = nome;
    _descricao = descricao;
    _nacionalidade = nacionalidade;
    _tipo = tipo;
  }

  int? get id => _id;
  String? get nome => _nome;
  String? get descricao => _descricao;
  Nacionalidade? get nacionalidade => _nacionalidade;
  Tipo? get tipo => _tipo;

  set id(int? value) => _id = value;
  set nome(String? value) => _nome = value;
  set descricao(String? value) => _descricao = value;
  set nacionalidade(Nacionalidade? value) => _nacionalidade = value;
  set tipo(Tipo? value) => _tipo = value;
}