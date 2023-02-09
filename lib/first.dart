import 'package:first_provider/changeNotifier.dart';
import 'package:first_provider/main.dart';
import 'package:first_provider/proxyProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // const FirstScreen(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textappstyle = TextAppStyle(context);
    final toggleDarkMode =
        Provider.of<DarkModeModel>(context, listen: false).toggle();
    var isdarkmode = Provider.of<DarkModeModel>(context).isDark;
    return Scaffold(
      backgroundColor: isdarkmode ? Colors.indigo[900] : Colors.indigo[100],
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(context.read<Name>().name.toString(),
                style: _textappstyle.apptextstyle),
            const SizedBox(
              height: 40,
            ),
            Count(),
            SizedBox(
              height: 100,
            ),
            Switch(value: isdarkmode, onChanged: toggleDarkMode),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppCode()),
                  );
                },
                child: Text('App Code')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          key: const Key('increment_floatingActionButton'),
          onPressed: () => context.read<Counter>().increament(),
          child: Icon(Icons.add)),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  // const Count({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final _textappstyle = TextAppStyle(context);

    return Text(
      '${context.watch<Counter>().count}',
      key: const Key('counterState'),
      style: _textappstyle.apptextstyle,
    );
  }
}
