import 'package:car_sharing/firebase_options.dart';
import 'package:car_sharing/screens/auth_screen.dart';
import 'package:car_sharing/screens/drive_screen.dart';
import 'package:car_sharing/services/firebase_service.dart';
import 'package:car_sharing/services/map_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/base_screen.dart';
import 'screens/launch_screen_options.dart';
import 'screens/launch_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MapScreenProvider(),
          child: const MyApp(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/drive': (context) => DriveScreen(),
        '/launchscreenoptions': (context) => const LaunchScreenOptions(),
        '/': (context) => StreamProvider.value(
              initialData: null,
              value: FirebaseService().user,
              child: const LaunchScreen(),
            ),
        '/auth': (context) => const AuthScreen("None"),
        '/home': (context) => const BaseScreen(),
      },
    );
  }
}
