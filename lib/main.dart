import 'package:tawasol_app/providers/my_provider.dart';
import 'package:tawasol_app/screens/add_room/add_room_screen.dart';
import 'package:tawasol_app/screens/chat/chat_screen.dart';
import 'package:tawasol_app/screens/create_account/create_account.dart';
import 'package:tawasol_app/screens/home/home_screen.dart';
import 'package:tawasol_app/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        ChatScreen.routeName: (c) => ChatScreen(),
        AddRoomScreen.routeName: (c) => AddRoomScreen()
      },
    );
  }
}

// flutter pub add firebase_core: ^2.4.0
// flutter pub add firebase_auth: ^4.2.3
// flutter pub add provider: ^6.0.5
// flutter pub add cloud_firestore: ^4.3.1
// flutter pub add intl: ^0.17.0