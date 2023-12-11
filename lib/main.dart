import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workshop_nextapps/club/club.dart';
import 'package:workshop_nextapps/i18n/i18n.dart';
import 'package:workshop_nextapps/locator/locator.dart';
import 'package:workshop_nextapps/theme/theme.dart';

import 'form/form_screen.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello world!'),
      //   ),
      // ),
      title: 'Workshop NextApps',
      locale: const Locale('en'),
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        WorkshopLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // routes: {
      //   'detail': (context) => ClubDetailScreen(clubId: 2),
      // },
      // onGenerateRoute: (RouteSettings settings)  {
      //   final name = settings.name;
      //   return MaterialPageRoute(builder: builder)
      // },
      home: HomeScreen(),
      // home: ClubDetailScreen(
      //   clubId: 2,
      // ),
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return FormExampleScreen();
                  }));
                },
                child: Text('Go to form')),
            GestureDetector(
              onTap: () async {
                final navigator = Navigator.of(context);
                final result = await navigator.push<String>(MaterialPageRoute(
                  builder: (context) {
                    return ClubDetailScreen(clubId: 2);
                  },
                ));
                print('result: $result');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Go to Club Detail'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
