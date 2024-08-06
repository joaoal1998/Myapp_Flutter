import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'nota': 10},
        {'texto':'Vermelho', 'nota': 5},
        {'texto':'Verde', 'nota': 3},
        {'texto':'Branco', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 5},
        {'texto': 'Cobra', 'nota': 9},
        {'texto': 'Elefante', 'nota': 8},
        {'texto': 'Leão', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu nome favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 1},
        {'texto': 'João', 'nota': 6},
        {'texto': 'Débora', 'nota': 10},
        {'texto': 'Pedro', 'nota': 0}
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : const Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
