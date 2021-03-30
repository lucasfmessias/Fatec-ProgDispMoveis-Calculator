import '../controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
          _buildDisplayHistory(text: _controller.history.join().toString()),
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.orange[400]),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Calculadora"),
      backgroundColor: Colors.black,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.share),
          onPressed: () => _shareApplication(context),
        ),
      ],
    );
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontSize: 72, fontFamily: 'Calculator_font'),
        ),
      ),
    );
  }

  Widget _buildDisplayHistory({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontSize: 42, fontFamily: 'Calculator_font'),
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
          _buildButton(label: "AC", colorText: Colors.orange[400]),
          _buildButton(label: "DEL", colorText: Colors.orange[400]),
          _buildButton(label: "%", colorText: Colors.orange[400]),
          _buildButton(label: "/", colorText: Colors.orange[400])
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
          _buildButton(label: "*", colorText: Colors.orange[400]),
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
          _buildButton(label: "+", colorText: Colors.orange[400])
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
          _buildButton(label: "-", colorText: Colors.orange[400])
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
          _buildButton(label: "=", colorButton: Colors.orange[400])
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label,
      int flex = 1,
      Color colorText = Colors.white,
      Color colorButton = Colors.black}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: colorText),
        ),
        color: colorButton,
        onPressed: () => _calculateLogic(label),
      ),
    );
  }

  _calculateLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }

  void _shareApplication(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    final String text = "Share calculator app";

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
