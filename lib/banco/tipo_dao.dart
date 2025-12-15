import 'package:paraisodocafe/models/tipo.dart';
import 'database_helper.dart';

class TipoDAO {

  static Future<int> cadastrarTipo(String nome, String desc) async{
    final db = await DatabaseHelper.getDatabase();




    final dados = {
      'nm_tipo': nome,
      'desc_tipo': desc
    };

    try {
      int id = await db.insert('tb_tipo', dados);
      return id;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }


  static Future imprimir() async {
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query('tb_tipo');

    if (resultado.isEmpty) {
      print("A tabela tb_tipo está vazia.");
    } else {
      print("📌 Tipos Cadastradas:");
      for (var tipo in resultado) {
        print(tipo);
      }
    }
  }

  static Future<Tipo> listar(int? id) async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_tipo',
        where: 'id_tipo = ?',
        whereArgs: [id]
    );

    return Tipo(
        id: resultado.first['id_nacionalidade'] as int,
        nome: resultado.first['nm_nacionalidade'] as String,
        descricao: resultado.first['desc_nacionalidade'] as String
    );
  }

  static Future<void> excluir(int? id) async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_tipo',
        where: 'id_tipo = ?',
        whereArgs: [id]
    );
  }

  static Future<List<Tipo>> listarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa) {
      return Tipo(
          id: mapa['id_tipo'] as int,
          nome: mapa['nm_tipo'] as String,
          descricao: mapa['desc_tipo'] as String
      );
    }).toList();
  }
}