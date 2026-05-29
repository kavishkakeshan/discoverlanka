import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/bottomNavigation.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:flutter/material.dart';

class Destinationspage extends StatefulWidget {
  const Destinationspage({super.key});

  @override
  State<Destinationspage> createState() => _DestinationspageState();
}

class _DestinationspageState extends State<Destinationspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}