import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:paraisodocafe/telas/tela_cad_produto.dart';
import 'package:paraisodocafe/banco/nacionalidade_dao.dart';
import 'package:paraisodocafe/banco/tipo_dao.dart';

class TelaCadNT extends StatelessWidget {
  TelaCadNT({super.key});

  final TextEditingController nomenacController = TextEditingController();
  final TextEditingController descnacController = TextEditingController();
  final TextEditingController nometipoController = TextEditingController();
  final TextEditingController desctipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBC2A6),
      appBar: AppBar(title: const Text('Cadatsro de Nacionalidade e Tipo'),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF414A37),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nacionalidade: "),
            const SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Nome',
                  labelStyle: TextStyle(
                      color: Color(0xFF446C2C), fontSize: 15)),
              controller: nomenacController,
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Descrição',
                  labelStyle: TextStyle(
                      color: Color(0xFF446C2C), fontSize: 15)),
              controller: descnacController,
            ),
            Text("Tipo: "),
            const SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Nome',
                  labelStyle: TextStyle(
                      color: Color(0xFF446C2C), fontSize: 15)),
              controller: nometipoController,
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Descrição',
                  labelStyle: TextStyle(
                      color: Color(0xFF446C2C), fontSize: 15)),
              controller: desctipoController,
            ),
            const SizedBox(height: 40),


            ElevatedButton(onPressed: () async {
              final sucesso = await NacionalidadeDAO.cadastroNacionalidade(
                  nomenacController.text, descnacController.text);

              final imprimir = await NacionalidadeDAO.imprimir();
              if (sucesso > 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Nacionalidade: ${nomenacController} e Tipo: ${nometipoController} cadastrados com sucesso!"),
                      backgroundColor: Colors.green,)
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaCadProduto())
                );

                return imprimir;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login ou sennha inválidos."))
                );
              }
            }, child: Text('Realizar Cadastro')),

            ElevatedButton(onPressed: () async{

              final solucao = await TipoDAO.cadastrarTipo(
                  nometipoController.text, desctipoController.text);

              final imprimir = await TipoDAO.imprimir();
              if(solucao > 0){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Tipo: ${nometipoController} cadastrados com sucesso!"),
                      backgroundColor: Colors.green,)
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaCadProduto())
                );
                return imprimir;
              }else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login ou sennha inválidos."))
                );
              }

              },child: Text("Cadastro Tipo"))


          ],
        ),
      ),
    );
  }
}