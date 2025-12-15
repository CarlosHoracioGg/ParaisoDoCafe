import 'package:flutter/material.dart';
import 'package:paraisodocafe/models/usuario.dart';
import 'package:paraisodocafe/telas/tela_cad_nac_tipo.dart';
import 'tela_home.dart';
import '../banco/usuario_dao.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Color(0xFFDBC2A6),
      appBar: AppBar(title: const Text('Login'),
        titleTextStyle: TextStyle( color:Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF414A37),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

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

            ElevatedButton(onPressed: ()async{
              final sucesso = await UsuarioDAO.autenticar(loginController.text, senhaController.text);

              if(loginController.text == 'admin1' && senhaController.text == 'admin1'){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaCadNT())
                );
              } else if(sucesso ){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaHome())
                );
              }else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login ou sennha inválidos."))
                );
              }

            }, child: Text('Realizar Login'))


          ],
        ),
      ),
    );
  }
}