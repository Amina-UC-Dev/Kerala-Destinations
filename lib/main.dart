import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/providers/database_provider.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/screens/onboarding/spalsh_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your appli cation.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: TempleProvider()),
        ChangeNotifierProvider.value(value: LocalDataBaseProvider()),
      ],
      child: MaterialApp(
        title: 'Kerala Destinations',
        color: primary,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primary,
          scaffoldBackgroundColor: white
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
