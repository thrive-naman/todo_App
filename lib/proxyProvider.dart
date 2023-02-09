import 'package:first_provider/changeNotifier.dart';
import 'package:first_provider/first.dart';
import 'package:first_provider/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AppCode extends StatefulWidget {
  const AppCode({super.key});

  @override
  State<AppCode> createState() => _AppCodeState();
}

class _AppCodeState extends State<AppCode> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeModel>(context).isDark;
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: _incrementCounter,
        child: Icon(Icons.text_increase),
      ),
      backgroundColor: isDarkMode ? Colors.amber[900] : Colors.amber[100],
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   'Times Button Pressed',
            //   style: apptextstyle,
            // ),
            // MultiProvider(
            //   providers: [
            //     Provider(create: (_) => FirstPartSentence('This is')),
            //     Provider(create: (_) => FirstPartSentence('counter :')),
            //     ProxyProvider0<int>(
            //       update: (ctx, _) => _counter,
            //     ),
            //     ProxyProvider<int, Translation>(
            //       update: (_, val, __) => Translation(val),
            //     )
            //   ],
            //   // child: CounterNumber(),
            //   child: CounterWidget(),
            // ),

            ProxyProvider0<Translation>(
              update: (ctx, _) {
                final firstPart = Provider.of<FirstPartSentence>(context).title;
                final secondPart =
                    Provider.of<SecondPartSentence>(context).title;

                return Translation(
                    firstPart + _counter.toString() + secondPart);
              },
              child: CounterWidget(),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstScreen()),
                  );
                },
                child: Text('First Screen')),
          ],
        ),
      ),
    );
  }
}

class CounterNumber extends StatelessWidget {
  const CounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<int>(context).toString();
    final _textStyle = TextAppStyle(context);
    return Text(
      counter,
      style: _textStyle.apptextstyle,
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final translation = Provider.of<Translation>(context);
    final _textAppStyle = TextAppStyle(context);
    bool isDarkMode = Provider.of<DarkModeModel>(context).isDark;
    return Text(
      translation.title,
      style: _textAppStyle.apptextstyle,
    );
  }
}

class Translation {
  final _value;

  Translation(this._value);

  String get title => '$_value';
}

class FirstPartSentence {
  String _value;

  FirstPartSentence(this._value);

  String get title => _value;
}

class SecondPartSentence {
  String _value;

  SecondPartSentence(this._value);

  String get title => _value;
}
