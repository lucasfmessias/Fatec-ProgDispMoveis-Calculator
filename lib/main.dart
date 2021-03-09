import 'package:calculator/pages/calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  // Tudo no flutter são widgets (componentes visuais)
  // Dois tipos:
  // 1 - Guarda o estado (redesenhar componentes na tela) - StatefullWidget
  // 2 - Não precisa guardar estado (desenhar uma única vez, não tem modificação visual) - StatelessWidget

  runApp(MyApp());
}

// stl -> Para chamar padrão de preenchimento statelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepPurple,
      ),
      home: CalculatorPage(),
    );
  }
}
