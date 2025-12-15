import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paraisodocafe/banco/nacionalidade_dao.dart';
import 'package:paraisodocafe/banco/produto_dao.dart';
import 'package:paraisodocafe/banco/tipo_dao.dart';
import 'package:paraisodocafe/models/nacionalidade.dart';
import 'package:paraisodocafe/models/tipo.dart';
import 'package:paraisodocafe/telas/tela_home.dart';

class TelaCadProduto extends StatefulWidget{
    TelaCadProduto ({super.key});
    @override
    State<TelaCadProduto> createState() => TelaCadProdutoState();
}
class TelaCadProdutoState extends State<TelaCadProduto>{
  //Itens de Nacionalidade
  String? nacionalidadeSelecionada;
  List<Nacionalidade> nacioExistente = [];
  int? nacId;

  //Itens de Tipo
  String? tipoSelecionado;
  List<Tipo> tipoExistente = [];
  int? tipoId;

  //Dados dos Text Fields
  TextEditingController nomeController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState(){
    super.initState();
    carregarNacionalidades();
    carregarTipos();
  }

  Future<void> carregarNacionalidades()async{
    final listar = await NacionalidadeDAO.listarTodos();
    setState(() {
      nacioExistente = listar;
    });
  }

  Future<void> carregarTipos()async{
    final listar = await TipoDAO.listarTodos();
    setState(() {
      tipoExistente = listar;
    });
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Color(0xFFDBC2A6),
      appBar: AppBar(title: const Text('Cadastro de Produtos', style: TextStyle(color: Color(0xFFFFFFFF)),),
        backgroundColor: Color(0xFF414A37),),
      body: Padding(padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cadastre o Produto", style: TextStyle(color: Color(0xFFFFFFFF)),),
          TextFormField(
            style: TextStyle(color: Color(0xFFFFFFFF)),
            decoration: InputDecoration(labelText: 'Nome:', labelStyle: TextStyle(fontSize: 15, color: Color(
                0xFF000000)), ),
            controller: nomeController,
          ),
          TextFormField(
            style: TextStyle(color: Color(0xFFFFFFFF)),
            decoration: InputDecoration(labelText: 'Descrição:', labelStyle: TextStyle(fontSize: 15, color: Color(0xFF000000))),
            controller: descController,
          ),
          Text("Nacionalidade", style: TextStyle(color: Color(0xFFFFFFFF)),),

          //Lista Nacionalidade
          DropdownButtonFormField<String>(
              items: nacioExistente.map((nacionalidade){
                return DropdownMenuItem<String>(
                    value: nacionalidade.nome,
                    child: Text("${nacionalidade.nome}", style: TextStyle(color: Color(0xFF000000)),),
                );
              }).toList(), onChanged: (value) {
              nacionalidadeSelecionada = value;
              Nacionalidade nacSelecionada = nacioExistente.firstWhere(
                  (nacionalidade)=>nacionalidade.nome == value,
              );
              nacId = nacSelecionada.id;
          }
          ),
          const SizedBox(height: 10,),

          //Lista Tipos
          DropdownButtonFormField<String>(
              items: tipoExistente.map((tipo){
                return DropdownMenuItem<String>(
                  value: tipo.nome,
                  child: Text("${tipo.nome}", style: TextStyle(color: Color(0xFF000000)),),
                );
              }).toList() ,
              onChanged: (value) {
                tipoSelecionado = value;
                Tipo tipoSelecionados = tipoExistente.firstWhere(
                    (tipo)=>tipo.nome == value,
                );
                tipoId = tipoSelecionados.id;
              }),
          ElevatedButton(onPressed: ()async{
            final sucesso = await ProdutoDAO.cadastroProduto(
            nomeController.text, descController.text, nacId, tipoId
            );

            final imprimir = await ProdutoDAO.imprimir();

            if (sucesso > 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Produto: ${nomeController} cadastrado com sucesso! "),
                    backgroundColor: Colors.green,)
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaHome())
              );

              return imprimir;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login ou sennha inválidos."))
              );
            }
          }, child: Text("Cadastrar"))


        ],
      ),
      ),
    );
  }
}