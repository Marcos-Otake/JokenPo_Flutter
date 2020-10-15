import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final String _nome = "Joken Po";
  var _mensagemJogo = "Selecione sua Jogada";
  var _imagemApp = AssetImage("image/padrao.png");
  var _imagemJogador = AssetImage("image/padrao.png");
  var _contadorJogadas = 0;
  var _contadorVitorias = 0;
  var _contadorDerrotas = 0;
  var _contadorEmpates = 0;

  void zerarJogada(){
    setState(() {
      _contadorJogadas = 0;
      _contadorDerrotas = 0;
      _contadorEmpates = 0;
      _contadorVitorias = 0;
      _mensagemJogo = "Selecione sua Jogada";
      _imagemApp = AssetImage("image/padrao.png");
      _imagemJogador = AssetImage("image/padrao.png");
    });
  }

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("image/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("image/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("image/tesoura.png");
        });
        break;
    }

    //Definir Estampa escolha Jogador
    if (escolhaUsuario == "pedra") {
      setState(() {
        _imagemJogador = AssetImage("image/pedra.png");
      });
    } else if (escolhaUsuario == "papel") {
      setState(() {
        _imagemJogador = AssetImage("image/papel.png");
      });
    } else {
      setState(() {
        _imagemJogador = AssetImage("image/tesoura.png");
      });
    }

    //Verificações de Vitória
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _mensagemJogo = "Parabéns Você Ganhou!";
        _contadorVitorias = _contadorVitorias + 1;
        _contadorJogadas = _contadorJogadas + 1;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        _mensagemJogo = "Infelizmente Você Perdeu :(";
        _contadorDerrotas = _contadorDerrotas + 1;
        _contadorJogadas = _contadorJogadas + 1;
      });
    } else {
      setState(() {
        _mensagemJogo = "Jogo Empatado!";
        _contadorJogadas = _contadorJogadas + 1;
        _contadorEmpates = _contadorEmpates + 1;
      });
      print(_contadorJogadas);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_nome),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Visualizar Jogadas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image(
                    image: this._imagemJogador,
                    width: 150,
                  ),
                  Text(
                    "Minha Escolha",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: this._imagemApp,
                    width: 150,
                  ),
                  Text(
                    "Escolha do Jogo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Text(
              _mensagemJogo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "image/pedra.png",
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "image/papel.png",
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "image/tesoura.png",
                  width: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            child: Text(
              "Total de Jogadas:  " + _contadorJogadas.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                 fontWeight: FontWeight.bold,
                 color: Colors.purple,
                 ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Vitórias: " + _contadorVitorias.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Empates: " + _contadorEmpates.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Derrotas: " + _contadorDerrotas.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  zerarJogada();
                });
              },
              child: Text(
                "Reiniciar Contagem",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
