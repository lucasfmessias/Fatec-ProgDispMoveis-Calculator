import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  __CalculatatorPageStateState createState() => __CalculatatorPageStateState();
}

class __CalculatatorPageStateState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.blue),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() =>
      AppBar(title: Text("Calculadora"), backgroundColor: Colors.blue);

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.white, fontSize: 62),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
        color: Colors.black,
        height: 400,
        child: Column(
          children: [
            _buildKeyboardLine1(),
            _buildKeyboardLine2(),
            _buildKeyboardLine3(),
            _buildKeyboardLine4(),
            _buildKeyboardLine5(),
          ],
        ));
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: "AC", color: Colors.lightBlueAccent),
          _buildButton(label: "DEL", color: Colors.lightBlueAccent),
          _buildButton(label: "%", color: Colors.lightBlueAccent),
          _buildButton(label: "/", color: Colors.lightBlueAccent)
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: "7"),
          _buildButton(label: "8"),
          _buildButton(label: "9"),
          _buildButton(label: "*", color: Colors.lightBlueAccent)
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: "4"),
          _buildButton(label: "5"),
          _buildButton(label: "6"),
          _buildButton(label: "+", color: Colors.lightBlueAccent)
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: "1"),
          _buildButton(label: "2"),
          _buildButton(label: "3"),
          _buildButton(label: "-", color: Colors.lightBlueAccent)
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: "."),
          _buildButton(label: "0", flex: 2),
          _buildButton(label: "=", color: Colors.lightBlueAccent)
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: color),
        ),
        color: Colors.black,
        onPressed: () => _calculateLogic(label),
      ),
    );
  }

  _calculateLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
