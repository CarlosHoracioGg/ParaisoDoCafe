import 'database_helper.dart';
import 'package:paraisodocafe/models/usuario.dart';

class UsuarioDAO {
  static Usuario usuarioLogado = Usuario();

  static Future<int> cadastrarUsuario(String nome, String login, String senha) async {
    final db = await DatabaseHelper.getDatabase();

    final dadosUsuario = {
      'nm_usuario': nome,
      'nm_login': login,
      'ds_senha': senha, // idealmente, use hash da senha
    };

    try {
      int id = await db.insert('tb_usuario', dadosUsuario,);

      if (id == 0) {
        print("Usuário com este login já existe!");
      }

      return id; // ID do novo usuário, ou 0 se já existia
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1; // indica erro
    }
  }



  static Future<bool> autenticar(String login, String senha) async {
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query(
        'tb_usuario',
        where: 'nm_login = ? and ds_senha = ?',
        whereArgs: [login, senha]
    );

    //comentar sobre:
    usuarioLogado.id = resultado.first['id_usuario'] as int;
    usuarioLogado.nome = resultado.first['nm_usuario'] as String;
    usuarioLogado.login = resultado.first['nm_login'] as String;
    usuarioLogado.senha = resultado.first['ds_senha'] as String;
    //retorna o resultado que nao esta vazio
    return resultado.isNotEmpty;
  }

  static Future imprimir() async {
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query('tb_usuario');

    if (resultado.isEmpty) {
      print("A tabela tb_usuario está vazia.");
    } else {
      print("📌 Usuários cadastrados:");
      for (var usuario in resultado) {
        print(usuario);
      }
    }
  }
}