import 'package:paraisodocafe/banco/database_helper.dart';
import 'package:paraisodocafe/models/nacionalidade.dart';
import 'package:paraisodocafe/models/produto.dart';
import 'package:paraisodocafe/models/tipo.dart';


class ProdutoDAO {

  static Future<int> cadastroProduto(String nome, String descricao, int? nacionalidade, int? tipo) async{

    final db = await DatabaseHelper.getDatabase();

    final dados = {
      'nm_cafe': nome,
      'desc_cafe': descricao,
      'id_nacionalidade':nacionalidade,
      'id_tipo': tipo
    };

    try {
      int id = await db.insert('tb_cafe', dados);
      return id;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }

  static Future imprimir() async {
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query('tb_cafe');

    if (resultado.isEmpty) {
      print("A tabela tb_cafe está vazia.");
    }  else {
      print("📌 Produtos Cadastrados:");
      for (var cafe in resultado) {
        print(cafe);
      }
    }
  }


  static Future<List<Produto>> listarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_cafe');

    return resultado.map((mapa) {
      return Produto(
        id: mapa['id_cafe'] as int,
        nome: mapa['nm_cafe'] as String,
        descricao: mapa['desc_cafe'] as String,
        idNacionalidade: mapa['id_nacionalidade'] as int,
        idTipo: mapa['id_tipo'] as int,
      );
    }).toList();
  }


  static Future<void> excluir(int? id) async {
    final db = await DatabaseHelper.getDatabase();
    await db.delete(
      'tb_cafe',
      where: 'id_cafe = ?',
      whereArgs: [id],
    );
  }

}

