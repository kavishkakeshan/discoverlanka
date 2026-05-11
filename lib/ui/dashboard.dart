import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:discoverlanka/components/ComSlides/customTravelersSlide.dart';
import 'package:discoverlanka/components/ComSlides/customWhyChooseSlides.dart';
import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/ComSlides/customExploreSlides.dart';
import 'package:discoverlanka/components/bottomNavigation.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/components/customInputField.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:discoverlanka/data/slideDataList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
            CustomExploreSlides(slides: carouselExploreSlides(context)),
            SizedBox(height: 30),
            Container(
              color: const Color.fromARGB(255, 0, 102, 34),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Subscribe to Our Newsletter',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Get the latest travel updates and exclusive offers straight to your inbox.',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomInputField(
                          name: 'email',
                          labelText: 'Enter Your Email',
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.email(
                              errorText: 'Please enter a valid email address.',
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(color: Colors.green.shade400),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Follow us on: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.xTwitter,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.purple,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
