import 'package:flutter/material.dart';
import 'package:pass_gen/generator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String randomPassword = '';
  int passwordLength = 16;
  Map<String, bool> includes = {
    'lower': true,
    'upper': true,
    'numbers': true,
    'symbols': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(randomPassword),
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
              value: includes['lower']!,
              onChanged: (newValue) =>
                  setState(() => includes['lower'] = newValue),
            ),
            SwitchListTile(
              title: const Text('Include Uppercase'),
              value: includes['upper']!,
              onChanged: (newValue) =>
                  setState(() => includes['upper'] = newValue),
            ),
            SwitchListTile(
              title: const Text('Include Number'),
              value: includes['numbers']!,
              onChanged: (newValue) =>
                  setState(() => includes['numbers'] = newValue),
            ),
            SwitchListTile(
              title: const Text('Include Symbol'),
              value: includes['symbols']!,
              onChanged: (newValue) =>
                  setState(() => includes['symbols'] = newValue),
            ),
            ElevatedButton(
              onPressed: () => setState(
                () =>
                    randomPassword = generatePassword(passwordLength, includes),
              ),
              child: const Text('Generate Password'),
            ),
          ],
        ),
      ),
    );
  }
}
