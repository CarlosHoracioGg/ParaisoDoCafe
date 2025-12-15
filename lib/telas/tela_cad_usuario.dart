import 'package:flutter/material.dart';
import 'package:paraisodocafe/banco/usuario_dao.dart';
import 'package:paraisodocafe/telas/tela_login.dart';
import 'package:paraisodocafe/telas/tela_home.dart';

class TelaCadastro extends StatelessWidget{
  TelaCadastro({super.key});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFDBC2A6),
      appBar: AppBar(title: const Text("Cadastro"),
          titleTextStyle: TextStyle( color:Color(0xFFFFFFFF)),
          backgroundColor: Color(0xFF414A37)),
      body: Padding(padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Usuario', labelStyle: TextStyle(color: Color(0xFF446C2C), fontSize: 15)),
              controller: nomeController,
            ),

            const SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Login', labelStyle: TextStyle(color: Color(0xFF446C2C), fontSize: 15)),
              controller: loginController,
            ),

            const SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              decoration: const InputDecoration(labelText: 'Senha', labelStyle: TextStyle(color: Color(0xFF446C2C), fontSize: 15)),
              obscureText: true,
              controller: senhaController,
            ),


            const SizedBox(height: 40),
            //Botão Cadastro
            ElevatedButton(onPressed: ()async{
              await UsuarioDAO.imprimir();
              final sucesso = await UsuarioDAO.cadastrarUsuario(
                  nomeController.text,
                  loginController.text,
                  senhaController.text
              );
              final imprimir = await UsuarioDAO.imprimir();
              if (sucesso > 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('"${nomeController.text}" cadastrado com sucesso! ID: $sucesso'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaHome()),
                );
                return imprimir;
              }else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Erro ao cadastrar usuário."), backgroundColor: Colors.red,),
                );
              }

              await UsuarioDAO.imprimir();

            }, child: Text('Cadastrar'),
            ),
            const SizedBox(height: 20,),
            //Botão ir ao Login
            ElevatedButton(onPressed: () async{
              await UsuarioDAO.imprimir();

              final imprimir = await UsuarioDAO.imprimir();

              if(imprimir != null){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                );
                return imprimir;
              }



            }, child: Text("Login")),



          ],
        ),
      ),
    );
  }
}