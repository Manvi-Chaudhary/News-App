
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:triveous_news_app/NewsProvider.dart';
import 'Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/Authentication.dart';
import 'package:provider/provider.dart';
import 'services/Authentication.dart';
import 'services/Database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try{

    const firebaseconfig = FirebaseOptions(
        apiKey: "AIzaSyCyp0NBHVsNjv8Ig5m-TpdXWhMZ7rOsnto",
        appId: "1:921290435175:android:90322dee618588a02bc2c2",
        messagingSenderId: "921290435175",
        projectId: "triveous-news-app");
    await Firebase.initializeApp(options: firebaseconfig);
  }
  catch(e){
    print("error manvi : "+ e.toString());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider.value(value: Authservice().user, initialData: null),
    ChangeNotifierProvider(
    create: (_) => NewsProvider()),
        ],
        child: MaterialApp(
          // Application name
          title: 'News App',

          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Hanken Grotesk",
          ),
          // A widget which will be started on application startup
          home: Wrapper(),
        ));
  }
}


