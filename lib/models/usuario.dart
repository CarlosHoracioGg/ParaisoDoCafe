class Usuario{
  int? _id;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({int? id, String? nome, String? login, String? senha}){
    _id = id;
    _nome = nome;
    _login = login;
    _senha = senha;
  }

  int? get id => _id;
  String? get nome => _nome;
  String? get login => _login;
  String? get senha => _senha;

  set id(int? value) => _id = value;
  set nome(String? value) => _nome = value;
  set login(String? value) => _login = value;
  set senha(String? value) => _senha = value;
}