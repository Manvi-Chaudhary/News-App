import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triveous_news_app/Authenticate/Authnticate.dart';
import 'HomePage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String?>(context);
    return (user==null) ? Authenticate() : HomePage();
  }
}
