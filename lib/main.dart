import 'package:flutter/material.dart';
import 'package:paraisodocafe/telas/tela_cad_nac_tipo.dart';
import 'package:paraisodocafe/telas/tela_cad_usuario.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // desativa o modo banner ( que exibe conteudo).
      debugShowCheckedModeBanner: false,
      home: TelaCadNT(),

    );
  }
}