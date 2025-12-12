/*import 'package:flutter/material.dart';
import 'package:tst/banco/cafe_dao.dart'; // Seu DAO do banco
import 'package:tst/cafe.dart'; // Seu modelo Cafe
import 'tela_cad_produto.dart';

class TelaProdutos extends StatefulWidget {
  const TelaProdutos({super.key});

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  late Future<List<Cafe>> produtosDoBanco;

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  void _carregarProdutos() {
    produtosDoBanco = CafeDAO().listarProdutos(); // Função que retorna Future<List<Cafe>>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBC2A6),
      appBar: AppBar(
        title: const Text('Produtos'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: const Color(0xFF414A37),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final resultado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TelaCadProduto(),
                ),
              );
              if (resultado == true) {
                setState(() {
                  _carregarProdutos();
                });
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Title(
                color: Colors.white,
                child: Text(
                  "Nossos Produtos",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),

              // ===========================
              // PRODUTOS FIXOS
              // ===========================
              _produtoFixo(
                "Café Especial",
                "Grãos selecionados com torra média, aroma intenso e sabor encorpado. Ideal para amantes de um café de qualidade.",
                28.90,
              ),
              _produtoFixo(
                "Cappuccino Cremoso",
                "Mistura premium para um cappuccino suave e cremoso. Pode ser preparado quente ou gelado.",
                19.50,
              ),
              _produtoFixo(
                "Biscoitos de Café",
                "Deliciosos biscoitos artesanais com toque especial de café. Perfeitos para acompanhar sua bebida favorita.",
                12.00,
              ),

              const SizedBox(height: 20),

              // ===========================
              // PRODUTOS DINÂMICOS DO BANCO
              // ===========================
              FutureBuilder<List<Cafe>>(
                future: produtosDoBanco,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF414A37),
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text(
                      'Nenhum produto cadastrado.',
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    final produtos = snapshot.data!;
                    return Column(
                      children: produtos.map((produto) {
                        return _produtoDinamico(produto);
                      }).toList(),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Função para criar produto fixo
  Widget _produtoFixo(String nome, String descricao, double preco) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF414A37),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nome,
              style: const TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(descricao,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 15),
          Text("R\$ ${preco.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: Color(0xFFDBC2A6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Função para criar produto dinâmico
  Widget _produtoDinamico(Cafe produto) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF414A37),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(produto.nome,
              style: const TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(produto.descricao,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 15),
          Text("R\$ ${produto.preco.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: Color(0xFFDBC2A6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}*/
