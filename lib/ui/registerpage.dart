// First name, Last name, Email, Password, Confirm Password, Profile Picture Upload, phone number, address, date of birth

import 'dart:io';
import 'package:discoverlanka/components/customInputField.dart';
import 'package:discoverlanka/components/topclipper.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final authService = AuthService();
  bool passwordVisible = true;
  bool _showText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(1900),
      lastDate: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),

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

  // 1. Add a form key at the top of your state class
  final _formKey = GlobalKey<FormBuilderState>();

  void register() async {
    //  Validate form first — stop if any field has errors
    if (!_formKey.currentState!.saveAndValidate()) {
      setState(() => _showText = true);
      return; // stops if validation fails
    }

    setState(() => _showText = false);

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final dateOfBirth = dobController.text.trim();
    final address = addressController.text.trim();

    try {
      final response = await authService.signUpWithEmailPassword(
        email,
        password,
        firstName,
        lastName,
        dateOfBirth,
        address,
      );

      if (!mounted) return;

      if (response.user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registration successful')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              decoration: const BoxDecoration(color: Colors.green),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.16),
                const Text(
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
                            backgroundImage: const NetworkImage(
                              'https://cdn-icons-png.flaticon.com/128/18743/18743396.png',
                            ),
                          ),
                    Positioned(
                      bottom: -15,
                      right: -10,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Color.fromARGB(255, 38, 104, 41),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Expanded forces this section to take up the remaining space
                Expanded(
                  child: FormBuilder(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomInputField(
                                  name: 'first_name',
                                  labelText: 'First Name',
                                  prefixIcon: Icons.person,
                                  controller: firstNameController,
                                  keyboardType: TextInputType.name,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required( errorText: 'First name is required'),
                                    FormBuilderValidators.minLength(2, errorText: 'First name must be at least 2 characters'),
                                    FormBuilderValidators.maxLength(50, errorText: 'First name must not exceed 50 characters'),
                                  ]),
                                ),
                              ),
                              Expanded(
                                child: CustomInputField(
                                  name: 'last_name',
                                  labelText: 'Last Name',
                                  prefixIcon: Icons.person_outline,
                                  controller: lastNameController,
                                  keyboardType: TextInputType.name,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(errorText: 'Last name is required'),
                                    FormBuilderValidators.minLength(2, errorText: 'Last name must be at least 2 characters'),
                                    FormBuilderValidators.maxLength(50, errorText: 'Last name must not exceed 50 characters'),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          CustomInputField(
                            name: 'email',
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Email is required'),
                              FormBuilderValidators.email(errorText: 'Please enter a valid email address'),
                              FormBuilderValidators.maxLength(50, errorText: 'Email must not exceed 50 characters'),
                            ]),
                          ),
                          CustomInputField(
                            name: 'date_of_birth',
                            labelText: 'Date of Birth',
                            prefixIcon: Icons.calendar_month,
                            controller: dobController,
                            keyboardType: TextInputType.datetime,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required( errorText: 'Date of birth is required'),
                            ]),
                          ),
                          CustomInputField(
                            name: 'address',
                            labelText: 'Address',
                            prefixIcon: Icons.home_filled,
                            controller: addressController,
                            keyboardType: TextInputType.multiline,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Address is required'),
                              FormBuilderValidators.minLength(5, errorText: 'Address must be at least 5 characters'),
                              FormBuilderValidators.maxLength(200, errorText: 'Address must not exceed 200 characters'),
                            ]),
                          ),
                          CustomInputField(
                            name: 'password',
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
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Password is required'),
                              FormBuilderValidators.minLength(6, errorText: 'Password must be at least 6 characters'),
                              FormBuilderValidators.maxLength(30, errorText: 'Password must not exceed 30 characters'),
                              FormBuilderValidators.match(
                                RegExp(r'(?=.*[A-Z])'), // Wrap with RegExp()
                                errorText:
                                    'Must contain at least one uppercase letter',
                              ),
                              FormBuilderValidators.match(
                                RegExp(r'(?=.*[a-z])'), // Wrap with RegExp()
                                errorText:
                                    'Must contain at least one lowercase letter',
                              ),
                              FormBuilderValidators.match(
                                RegExp(r'(?=.*\d)'), // Wrap with RegExp()
                                errorText: 'Must contain at least one number',
                              ),
                              FormBuilderValidators.match(
                                RegExp(
                                  r'(?=.*[@$!%*?&#^()_+\-=\[\]{};:"\\|,.<>\/?])',
                                ), // Wrap with RegExp()
                                errorText:
                                    'Must contain at least one special character',
                              ),
                            ]),
                          ),
                          CustomInputField(
                            name: 'confirm_password',
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
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: 'Please confirm your password'),
                              (val) {
                                if (val != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      register();
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 79, 182, 83),
                          Color.fromARGB(255, 113, 243, 109),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: _showText
                          ? const Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                              key: ValueKey('text'),
                            )
                          : const Icon(
                              Icons.check,
                              size: 30,
                              color: Color.fromARGB(255, 0, 0, 0),
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
                        builder: (context) => const Loginpage(),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Container(
                    color: const Color.fromARGB(255, 81, 182, 86),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
