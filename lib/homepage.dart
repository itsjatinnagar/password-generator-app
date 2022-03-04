import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void initState() {
    super.initState();
    setState(
      () => randomPassword = generatePassword(passwordLength, includes),
    );
  }

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
            GestureDetector(
              onTap: () =>
                  Clipboard.setData(ClipboardData(text: randomPassword)).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Generated Password copied to clipboard!'),
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14.0),
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.blue),
                child: Text(
                  randomPassword,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Courier New',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
