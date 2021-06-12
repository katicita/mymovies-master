import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:mymovies/provider/data_provider.dart';
import 'package:mymovies/view/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(FutureBuilder(
    future: loadUserData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // print("User Login ${snapshot.data}");

        return ChangeNotifierProvider(
          create: (_) => DataProvider(),
          child: MyApp(),
        );
      } else if (snapshot.hasError) {
        return Center(child: Text("Failed to get user data"));
      }
      return Center(child: CircularProgressIndicator());
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Colors.black,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
          )),
      home: LoginPage(),
    );
  }
}

///Metodo que obtiene toda los datos del usuario,
Future<bool> loadUserData() async {
  return true;
}
