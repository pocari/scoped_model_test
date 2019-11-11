import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MaterialApp(
    title: 'Scoped Model Test',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model Test'),
      ),
      body: CounterApp(),
    )));

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;

    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Column(
        children: <Widget>[
          ScopedModelDescendant<CounterModel>(
            builder: (ctx, child, model) => Text('${model.counter}'),
          ),
          ScopedModelDescendant<CounterModel>(
            builder: (ctx, child, model) => RaisedButton(
              onPressed: model.increment,
              child: Text('Plus Button'),
            ),
          ),
        ],
      ),
    );
  }
}
