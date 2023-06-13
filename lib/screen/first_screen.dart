import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/screen/sign_in_up.dart';
import 'package:new_project/screen/slider.dart';

class FisrtScreenN extends StatelessWidget {
  const FisrtScreenN({super.key});

  @override
  Widget build(BuildContext context) {
    
    final authService = FirebaseAuth.instance;
    return StreamBuilder(
        stream: authService.authStateChanges(),
        builder: (_, snapshot) => !snapshot.hasData
            ? const SignInUp()
            : CarouselWithIndicatorDemo());
  }
}