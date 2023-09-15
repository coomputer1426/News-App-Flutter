import 'dart:async';

import 'package:flutter/material.dart';

import 'home/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static const routeName = "initial";

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 7),
        // ()=>Navigator.pushAndRemoveUntil(context, HomeView.routeName));
        () => Navigator.pushReplacementNamed(context, HomeView.routeName));
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/pattern1x.png",
              // height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Image.asset("assets/images/brand.png")
        ],
      ),
    );
    // return Scaffold(body:
    // Center(child: Image.asset("assets/images/pattern1x.png", fit: BoxFit.fill,)),
    // );
  }
}
