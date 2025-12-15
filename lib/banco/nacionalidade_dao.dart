import 'database_helper.dart';
import 'package:paraisodocafe/models/nacionalidade.dart';

class NacionalidadeDAO {

  static Future<int> cadastroNacionalidade(String nome, String desc) async {
    final db = await DatabaseHelper.getDatabase();

    final dados = {
      'nm_nacionalidade': nome,
      'desc_nacionalidade': desc,
    };

    try {
      int id = await db.insert('tb_nacionalidade', dados);
      return id;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }

  static Future<Nacionalidade> listar(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_nacionalidade',
        where: 'id_nacionalidade = ?',
        whereArgs: [id]
    );

    return Nacionalidade(
        id: resultado.first['id_nacionalidade'] as int,
        nome: resultado.first['nm_nacionalidade'] as String,
        descricao: resultado.first['desc_nacionalidade'] as String
    );
  }

  static Future<void> excluir(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_nacionalidade',
        where: 'id_nacionalidade = ?',
        whereArgs: [id]
    );
  }

  static Future<List<Nacionalidade>> listarTodos() async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_nacionalidade');

    return resultado.map((mapa){
      return Nacionalidade(
          id: mapa['id_nacionalidade'] as int,
          nome: mapa['nm_nacionalidade'] as String,
          descricao: mapa['desc_nacionalidade'] as String
      );
    }).toList();
  }



  static Future imprimir() async {
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query('tb_nacionalidade');

    if (resultado.isEmpty) {
      print("A tabela tb_nacionalidade está vazia.");
    }  else {
        print("📌 Nacionalidades Cadastradas:");
        for (var nacionalidade in resultado) {
        print(nacionalidade);
    }
}
}
}