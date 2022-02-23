import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int passwordLength = 16;
  bool lower = true, upper = true, numbers = true, symbols = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: const Text('a983r4/aoweri'),
              ),
              Slider(
                label: 'Length $passwordLength',
                divisions: 30,
                min: 8,
                max: 38,
                value: passwordLength.toDouble(),
                onChanged: (newValue) =>
                    setState(() => passwordLength = newValue.toInt()),
              ),
              SwitchListTile(
                title: const Text('Include Lowercase'),
                value: lower,
                onChanged: (newValue) => setState(() => lower = newValue),
              ),
              SwitchListTile(
                title: const Text('Include Uppercase'),
                value: upper,
                onChanged: (newValue) => setState(() => upper = newValue),
              ),
              SwitchListTile(
                title: const Text('Include Number'),
                value: numbers,
                onChanged: (newValue) => setState(() => numbers = newValue),
              ),
              SwitchListTile(
                title: const Text('Include Symbol'),
                value: symbols,
                onChanged: (newValue) => setState(() => symbols = newValue),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Generate Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
