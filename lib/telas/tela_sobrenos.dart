import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paraisodocafe/telas/tela_home.dart';

class TelaSobreNos extends StatefulWidget{
  TelaSobreNos({super.key});
  @override
  State<TelaSobreNos> createState() => TelaSobreNosState();
}
class TelaSobreNosState extends State<TelaSobreNos>{

  @override

  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:  Color(0xFFDBC2A6),
      appBar: AppBar(
        title: const Text("Sobre Nós"),
        actions: [
          IconButton(onPressed: () async{
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaHome())
            );
          }, icon: Icon(Icons.arrow_back), color: Colors.white,)
        ],
        titleTextStyle: TextStyle( color:Color(0xFFFFFFFF), fontSize: 20),
        backgroundColor: Color(0xFF414A37),

      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Quem Somos?",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 10,),
                    Container(
                      height: 190,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xFF414A37),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Somos um grupo de programadores iniciantes no desenvolvimento de aplicativos mobile na"
                              " linguagem dart, sendo este nosso primeiro projeto pessoal de todo grupo, trazendo uma boa experiência em nosso aplicativo.",
                            style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),
                          ),
                        ],
                      ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Text("Qual nosso objetivo?",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 10,),
                    Container(
                      height: 130,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xFF414A37),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(padding: EdgeInsets.all(10),
                        child: Column(
                            children: [
                              Text("Aplicar todo nosso conhecimento em desenvolvimento mobile "
                                  "adquirido durante o curso de Análise e Desenvolvimento de Sistemas realizado pelo Senai. ",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                            ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Text("Desenvolvedores",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 20,),
                    Container(
                      height: 580,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xFF414A37),
                        borderRadius: BorderRadius.circular(20.0),
                      ),child: Padding(padding: EdgeInsets.all(10),
                    child:
                      Column(
                        children: [
                          Text("Carlos Eduardo",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'Nada se cria, tudo se copia.'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 20,),
                          Text("Christopher Ribeiro",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'O Palmeiras não tem Mundial!'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 20,),
                          Text("Gabriel Demarco",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'Tudo começa pelo sangue.'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 20,),
                          Text("Gabriel Soares",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'Tudo se cria, nada se copia.'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 20,),
                          Text("Matheus Rosa",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'Quer marretada do Thor?'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 20,),
                          Text("Vitor Lisboa",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 10,),
                          Text("'Preto tipo A.'",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),),
                          const SizedBox(height: 1000,),
                        ],
                      ),
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFF414A37),
                      ),child: Padding(padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Suporte:",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold,fontSize: 18)),
                              const SizedBox(height: 10,),
                              Text("Gmail: paraisodocafe_ofc@gmail.com",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18)),
                              const SizedBox(height: 10),
                              Text("Instagram: paraisodocafe_ofc",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18)),
                              const SizedBox(height: 10),
                              Text("Facebook: ParaisoDoCafe", style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18)),
                            ],
                          ),
                      ),
                    ),

                  ],
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}