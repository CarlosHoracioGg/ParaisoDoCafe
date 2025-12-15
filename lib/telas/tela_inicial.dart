import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:paraisodocafe/telas/tela_cad_usuario.dart';
import 'package:paraisodocafe/telas/tela_login.dart';

class TelaInicial extends StatelessWidget{
  TelaInicial ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF414A37),
      body:Padding(padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor:  Color(0xFFDBC2A6),
              padding: const EdgeInsets.all(14),
            ),onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro())
              );
            }, child: Text("Realizar Cadastro",style: TextStyle(color: Color(0xFFFFFFFF)),)),
          ),

          const SizedBox(height: 30,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor:  Color(0xFFDBC2A6),
              padding: const EdgeInsets.all(14),
            ),onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin())
              );
            }, child: Text("Realizar Login",style: TextStyle(color: Color(0xFFFFFFFF)),)),
          ),
        ],
      ),
      ),

    );
  }
}