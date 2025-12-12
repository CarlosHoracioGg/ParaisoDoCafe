import 'package:paraisodocafe/banco/database_helper.dart';
import 'package:paraisodocafe/models/produto.dart';


class ProdutoDAO {

  static Future<int> cadastroProduto(String nome, String descricao, String nacionalidade, String tipo) async{

    final db = await DatabaseHelper.getDatabase();

    final dados = {
      'nm_cafe': nome,
      'desc_cafe': descricao,
      'id_nacionalidade':
    }
  }
}
