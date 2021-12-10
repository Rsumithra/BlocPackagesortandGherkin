import 'package:blocpracticepattern/src/bloc/themebloc/theme_bloc.dart';
import 'package:blocpracticepattern/src/constants/contants.dart';
import 'package:blocpracticepattern/src/data/app_theme.dart';
import 'package:blocpracticepattern/src/pages/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const Contactapp());

class Contactapp extends StatefulWidget {
  const Contactapp({Key? key}) : super(key: key);

  @override
  State<Contactapp> createState() => _ContactappState();
}

class _ContactappState extends State<Contactapp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, AppTheme>(
        builder: (context, state) {
          AppTheme themeData = state;
          return MaterialApp(
            title: Constants.apptitle,
            theme: appThemeData[themeData],
            darkTheme: appThemeData[themeData],
            themeMode: ThemeMode.system,
            home: const TabPage(),
          );
        },
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const MaterialApp(home: TabPage());
}
