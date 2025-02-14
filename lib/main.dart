import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Gorjetas',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double valorConta = 0.0;
  double gorjeta = 0.0;

  void calcularGorjeta() {
    setState(() {
      gorjeta = valorConta * 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color corTitulo = Color(0xFFffb8c9);
    const Color corFundo = Color(0xFFFAF9F6);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de Gorjetas'),
          centerTitle: true,
          backgroundColor: corTitulo,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
    ),
      body: Center(
        child: Container(
          color: corFundo,
          padding: const EdgeInsets.all(20.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: const AssetImage('assets/pote.png'),
            ),
            const SizedBox(height: 20),
            Container (
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0,3),
                ),
              ],
            ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                setState(() {
                  valorConta = double.tryParse(value) ?? 0.0;
                  calcularGorjeta();
                });
              },
                decoration: InputDecoration(
                labelText: 'Digite o valor da conta',
                labelStyle: TextStyle(
                  color: Colors.grey[800],
                ),
                prefixIcon: Icon(Icons.attach_money),
                border: InputBorder.none,
              ),
            ),
            ),
              const SizedBox(height: 10),
              Text(
                'R\$ ${gorjeta.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightGreen),
              ),
          ],
        ),
      ),
    ));
  }
}



