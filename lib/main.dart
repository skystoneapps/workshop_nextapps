import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workshop_nextapps/club/club.dart';
import 'package:workshop_nextapps/i18n/i18n.dart';
import 'package:workshop_nextapps/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
      // title: 'Workshop NextApps',
      // locale: const Locale('en'),
      // supportedLocales: supportedLocales,
      // localizationsDelegates: [
      //   WorkshopLocalizationDelegate(),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // home: ClubDetailScreen(clubId: 2),
      // theme: lightTheme,
      // darkTheme: darkTheme,
    );
  }
}
