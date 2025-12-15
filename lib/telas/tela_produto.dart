import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paraisodocafe/banco/produto_dao.dart';
import 'package:paraisodocafe/models/produto.dart';
import 'package:paraisodocafe/telas/tela_cad_produto.dart';

class TelaProduto extends StatefulWidget{
  TelaProduto ({super.key});
  @override
  State<TelaProduto> createState() => TelaProdutoState();
}
class TelaProdutoState extends State<TelaProduto>{
List<Produto> produtos = [];
  @override
  void initState(){
    super.initState();
    carregarProdutos();
  }

Future<void> carregarProdutos() async{
  final lista = await ProdutoDAO.listarTodos();
  setState(() {
    produtos = lista;
  });
}

@override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Color(0xFFDBC2A6),
      appBar: AppBar(
        title: const Text("Produtos"),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF414A37),
        actions: [
          IconButton(onPressed: ()async{
            final t = await Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaCadProduto()));
            if(t == false || t == null){
              setState(() {
                carregarProdutos();
              });
            }
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final r = produtos[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'sem nome'),
                subtitle: Text('ID: ${r.id}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text("ATENÇÃO"),
                            content: const Text("Confirmar exclusão?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await ProdutoDAO.excluir(r.id);
                                  await carregarProdutos();
                                  Navigator.pop(context);
                                },
                                child: const Text("Sim"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                  ],
                ),
              ),
            );
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
          ]
        ),
    );
}
}