import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pagina2(),
    );
  }
}

class pagina2 extends StatefulWidget {
  const pagina2({Key? key}) : super(key: key);

  @override
  _pagina2State createState() => _pagina2State();
}

class _pagina2State extends State<pagina2> {
  final TextEditingController _quantidadeAController = TextEditingController();
  final TextEditingController _precoAController = TextEditingController();
  final TextEditingController _quantidadeBController = TextEditingController();
  final TextEditingController _precoBController = TextEditingController();
  String _resultado = '';

  void _calculaMaisBarato() {
    final quantidadeA = double.tryParse(_quantidadeAController.text) ?? 0;
    final precoA = double.tryParse(_precoAController.text) ?? 0;
    final quantidadeB = double.tryParse(_quantidadeBController.text) ?? 0;
    final precoB = double.tryParse(_precoBController.text) ?? 0;

    final precoUnitarioA = precoA / quantidadeA;
    final precoUnitarioB = precoB / quantidadeB;

    setState(() {
      if (precoUnitarioA < precoUnitarioB) {
        _resultado = "Mais barato: Achocolatado A.";
      } else if (precoUnitarioB < precoUnitarioA) {
        _resultado = "Mais barato: Achocolatado B.";
      } else {
        _resultado = "Os produtos têm o mesmo valor por unidade.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Preços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _quantidadeAController,
              decoration:
                  const InputDecoration(labelText: 'Quantidade Achocolatado A'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _precoAController,
              decoration:
                  const InputDecoration(labelText: 'Preço Achocolatado A'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _quantidadeBController,
              decoration:
                  const InputDecoration(labelText: 'Quantidade Achocolatado B'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _precoBController,
              decoration:
                  const InputDecoration(labelText: 'Preço Achocolatado B'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            ElevatedButton(
              onPressed: _calculaMaisBarato,
              child: const Text('Determinar o Mais Barato'),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
