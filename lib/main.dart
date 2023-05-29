import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _numberFrom;
  var _startMeasure;
  var _endMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  // creating diffent styles
  // input style
  final TextStyle inputStyle = TextStyle(fontSize: 20, color: Colors.blue[900]);
  final TextStyle labelStyle = TextStyle(fontSize: 24, color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measure Converter'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Spacer(),
                Spacer(
                  flex: 2,
                ),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                Spacer(),
                // Numeric input
                TextField(
                  onChanged: (newValue) {
                    var currentValue = double.tryParse(newValue);
                    if (currentValue != null) {
                      setState(() {
                        _numberFrom = currentValue;
                      });
                    }
                  },
                ),

                // From
                Text('From'),
                DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _startMeasure = newValue;
                    });
                  },
                  value: _startMeasure,
                ),
                // To
                Text('To'),
                DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _endMeasure = newValue;
                    });
                  },
                  value: _endMeasure,
                ),
                // Button converter
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Convert'),
                ),
                // Converted Value
                Text(_numberFrom == null ? '' : _numberFrom.toString()),
              ],
            )),
      ),
    );
  }

  // calls this method when the state is built
  @override
  void initState() {
    _numberFrom = 0.0;
    super.initState();
  }
}
