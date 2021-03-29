import '../core/constants.dart';

class CalculatorController {
  List<double> _memories = [0.0, 0.0];
  int _currentMemoryIndex = 0;
  String _operation;
  String _lastOperation;
  String _aux;
  bool _usedOperation;
  bool _usedEqual;
  String result;
  List<String> history = [];

  CalculatorController() {
    _clear();
  }

  void _clear() {
    result = kZero;
    _memories.setAll(kMemoryFirst, kMemoryClear);
    _currentMemoryIndex = kMemoryFirst;
    _operation = kOperationNull;
    _usedOperation = false;
    _usedEqual = false;
  }

  void _deleteDigit() {
    final length = result.length;
    if (length > 1) {
      result = result.substring(0, length - 1);
    } else {
      result = kZero;
    }
    _memories[_currentMemoryIndex] =
        double.parse(result.replaceAll(kPoint, '.'));
  }

  void _addDigit(String digit) {
    if (_usedOperation) result = kZero;
    if (result == kZero && digit != kPoint) result = kEmpty;
    if (result.contains(kPoint) && digit == kPoint) digit = kEmpty;

    result += digit;

    _memories[_currentMemoryIndex] = double.parse(result);
    _usedOperation = false;
  }

  void _setOperation(String operation) {
    if (_usedOperation && _operation == operation) return;

    if (_currentMemoryIndex == kMemoryFirst) {
      _currentMemoryIndex++;
    } else if (!_usedEqual || (_usedEqual && operation == '=')) {
      _memories[kMemoryFirst] = _calculate();
    }

    if (operation != '=') {
      _operation = operation;
      _usedEqual = false;
    } else {
      _usedEqual = true;
    }

    _outputFormat();
    _usedOperation = true;
  }

  void _outputFormat() {
    result = _memories[kMemoryFirst].toString();
    result = result.endsWith('.0') ? result.replaceAll('.0', '') : result;
  }

  double _calculate() {
    if (_operation == '+') return _memories[0] + _memories[1];
    if (_operation == '-') return _memories[0] - _memories[1];
    if (_operation == '*') return _memories[0] * _memories[1];
    if (_operation == '/') return _memories[0] / _memories[1];
    if (_operation == '%') return _memories[0] % _memories[1];
    return 0.0;
  }

  void applyCommand(String command) {
    // print('$_lastOperation != $command');

    if (_lastOperation != command) _showHistory(command);

    if (_lastOperation == '=') {
      history.removeRange(0, history.length);
      _showHistory(command);
    }

    if (_lastOperation == '=' && !kOperations.contains(command)) _clear();

    if (command == 'AC') {
      _clear();
    } else if (command == 'DEL') {
      _deleteDigit();
    } else if (kOperations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastOperation = command;
  }

  List<String> _showHistory(String button) {
    _aux = result;

    if (button == 'AC') history.removeRange(0, history.length);

    if (button != '=' && kOperations.contains(button)) {
      history.add('$_aux$button');
      _aux = '';
    }

    if (button == '=') history.add('$result$button');

    return history;
  }
}
