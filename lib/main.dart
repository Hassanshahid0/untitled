import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/Signup.dart';
import 'package:untitled/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _inilization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _inilization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("something wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Signup(),
          );
        });
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
               Navigator.push(
                context,
             MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: Text('Create an Account'),
          ),
        ],
      ),
    );
  }
}
