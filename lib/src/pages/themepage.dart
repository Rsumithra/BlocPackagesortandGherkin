import 'package:blocpracticepattern/src/bloc/themebloc/theme_bloc.dart';
import 'package:blocpracticepattern/src/bloc/themebloc/theme_event.dart';
import 'package:blocpracticepattern/src/data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Selection'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[itemAppTheme]!.primaryColor,
            child: ListTile(
              key: const ValueKey("ThemeDark"),
              title: Text(
                
                itemAppTheme.toString(),
              ),

              onTap: () {
                var themebloc = BlocProvider.of<ThemeBloc>(context);
                themebloc.add(ThemeToggle(itemAppTheme));
              },
            ),
          );
        },
      ),
    );
  }
}
