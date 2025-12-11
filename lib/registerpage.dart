// First name, Last name, Email, Password, Confirm Password, Profile Picture Upload, phone number, address, date of birth

import 'dart:io';
import 'package:discoverlanka/components/customInputField.dart';
import 'package:discoverlanka/components/topclipper.dart';
import 'package:discoverlanka/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  bool passwordVisible = true;
  bool _showText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.green),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // Format the date as DD - MM - YYYY
      setState(() {
        dobController.text =
            "${picked.day.toString().padLeft(2, '0')} - ${picked.month.toString().padLeft(2, '0')} - ${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.165,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      129,
                      150,
                      125,
                    ).withValues(alpha: 100),
                    spreadRadius: 8,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(flex: 1),
                Text(
                  'REGISTRATION',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Stack(
                  children: [
                    _selectedImage != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green[100],
                            backgroundImage: FileImage(_selectedImage!),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green[100],
                            backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/18743/18743396.png',
                            ),
                          ),
                    Positioned(
                      bottom: -15,
                      right: -10,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.add_a_photo, color: const Color.fromARGB(255, 38, 104, 41)),
                      ),
                    ),
                  ],
                ),
                // First Name Input Field
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                            labelText: 'First Name',
                            prefixIcon: Icons.person,
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        // Last Name Input Field
                        Expanded(
                          child: CustomInputField(
                            labelText: 'Last Name',
                            prefixIcon: Icons.person_outline,
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),

                    // Email Input Field
                    CustomInputField(
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // Date of Birth Input Field
                    CustomInputField(
                      labelText: 'Date of Birth',
                      prefixIcon: Icons.calendar_month,
                      controller: dobController,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                    ),
                    CustomInputField(
                      labelText: 'Address',
                      prefixIcon: Icons.home_filled,
                      controller: addressController,
                      keyboardType: TextInputType.multiline,
                    ),
                    // Password Input Field
                    CustomInputField(
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      obscureText: passwordVisible,
                      controller: passwordController,
                      onVisibilityToggle: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                    // Confirm Password Input Field
                    CustomInputField(
                      labelText: 'Confirm Password',
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      obscureText: passwordVisible,
                      controller: confirmPasswordController,
                      onVisibilityToggle: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showText = !_showText;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 79, 182, 83),
                          const Color.fromARGB(255, 113, 243, 109),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: AnimatedSwitcher(
                      duration: Duration(microseconds: 500),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: _showText
                          ? Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                              key: ValueKey('text'),
                            )
                          : Icon(
                              Icons.check,
                              size: 30,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              key: ValueKey('icon'),
                            ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => Loginpage(),
                      ),
                    );
                  },
                  child: Text(
                    "Already Have a Account ? Login Here",
                    style: TextStyle(
                      color: Colors.green[900],
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.green[900],
                      decorationThickness: 2,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,child: Container(
                  color: const Color.fromARGB(255, 81, 182, 86),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
