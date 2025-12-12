import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCadProduto extends StatefulWidget {
  @override
  TelaCadProdutoState createState() => TelaCadProdutoState();
}

class TelaCadProdutoState extends State<TelaCadProduto>{
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController nacionalidadeController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Produtos"),
      ),
      body: Padding(padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome',labelStyle: TextStyle(fontSize: 15)),
              controller: nomeController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Descrição', labelStyle: TextStyle(fontSize: 15)),
              controller: descricaoController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nacionalidade', labelStyle: TextStyle(fontSize: 15)),
              controller: nacionalidadeController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tipo', labelStyle: TextStyle(fontSize: 15)),
              controller: tipoController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()async{

            }, child: Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}