import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:discoverlanka/components/ComSlides/customTravelersSlide.dart';
import 'package:discoverlanka/components/ComSlides/customWhyChooseSlides.dart';
import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/ComSlides/customExploreSlides.dart';
import 'package:flutter/material.dart';
import 'package:discoverlanka/data/slideDataList.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade500,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              pause: Duration(milliseconds: 1500),
              animatedTexts: [
                TyperAnimatedText(
                  'DISCOVER LANKA',
                  speed: Duration(milliseconds: 200),
                ),
                TyperAnimatedText(
                  'Welcome to Sri Lanka !!!',
                  speed: Duration(milliseconds: 100),
                ),
              ],
            ),
          ),
        ), // Optional: matches your avatar color
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Why Choose Sri Lanka?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            CustomWhyChooseSlides(slides: carouselWhyChooseSlides),
            SizedBox(height: 20),
            Text(
              'What Our Travelers Say',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            CustomTravelesSlides(slides: carouselTravelersSlides),
            SizedBox(height: 20),
            Text(
              'Explore Our Paradise',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            CustomExploreSlides(slides: carouselExploreSlides),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
