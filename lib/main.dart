import 'package:first_provider/appRoutes.dart';
import 'package:first_provider/changeNotifier.dart';
import 'package:first_provider/first.dart';
import 'package:first_provider/formValidator.dart';
import 'package:first_provider/proxyProvider.dart';
import 'package:first_provider/taskList_view.dart';
import 'package:first_provider/taskModel.dart';
import 'package:first_provider/todoModel.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(Provider(create: (_) => Counter(), child: MyApp())
//       // runApp(const MyApp());
//       );
// }
class Name {
  String name = 'Naman';
}

class Age {
  int age = 23;
}

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FieldValidator()),
        ChangeNotifierProvider(create: (_) => ToDoModel()),
        ChangeNotifierProvider(create: (_) => DarkModeModel()),
        ChangeNotifierProvider(create: (_) => Counter()),
        Provider<Name>(create: (_) => Name()),
        Provider<Age>(create: (_) => Age()),
        Provider<FirstPartSentence>(
            create: (_) => FirstPartSentence('Button clicked ')),
        Provider<SecondPartSentence>(
            create: (_) => SecondPartSentence(' times.')),
      ],
      child: MyApp(),
    ),
  );
}

// void main(List<String> args) {
//   runApp(MyApp());
// }

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  increament() {
    _count++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.indigo,
      ),
      // home: TaskList(),
    );
  }
}

class TextAppStyle {
  BuildContext context;
  TextStyle? apptextstyle;
  TextAppStyle(this.context) {
    final isdarkmode = Provider.of<DarkModeModel>(context).isDark;

    apptextstyle = TextStyle(
        color: isdarkmode ? Colors.grey[100] : Colors.grey[900],
        fontWeight: FontWeight.w600,
        fontSize: 28);
  }
}

// Widget toggler(){
//   return Switch(value: value, onChanged: onChanged)

// }

class AppText {
  static const heading = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 32);

  static const subHeading = TextStyle(
      color: Color.fromARGB(255, 60, 60, 60),
      fontWeight: FontWeight.w600,
      fontSize: 18);

  static const smallContent = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static const content = TextStyle(
      color: Color.fromARGB(255, 60, 60, 60),
      fontWeight: FontWeight.w500,
      fontSize: 14);
}

class AppColors {
  static Color lightIndigo = Colors.indigo[100]!;
  static Color darkIndigo = Colors.indigo[900]!;
  static Color greyText = Colors.grey[900]!;
  static Color whiteText = Colors.white;
}
