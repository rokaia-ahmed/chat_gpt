
import 'package:flutter/material.dart';

import '../../core/constants/assets_manager.dart';
import 'chat_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3,),
      ()=>navigateTo(),
    );
    super.initState();
  }

  navigateTo(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ChatScreen(),
    ),);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Image.asset(AssetsManager.openaiLogo),
     ),
    );
  }
}
