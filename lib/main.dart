import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController campo = TextEditingController();
  String mensagem = '';

  void pesquisar() {
    String termo = campo.text.trim();

    if (termo == '') {
      setState(() {
        mensagem = 'Digite o nome de uma receita.';
      });
    } else {
      setState(() {
        mensagem = 'Você pesquisou: $termo';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            const SizedBox(height: 20),
            const Text(
              'Pesquisar receita',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: campo,
                decoration: const InputDecoration(
                  labelText: 'Nome da receita',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pesquisar,
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 20),
            Text(mensagem),
          ],
        ),
      ),
    );
  }
}