import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserprofileEmailchange extends StatefulWidget {
  const UserprofileEmailchange({super.key});

  @override
  State<UserprofileEmailchange> createState() => _UserprofileEmailchangeState();
}

class _UserprofileEmailchangeState extends State<UserprofileEmailchange> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormBuilderState>();
  final authService = AuthService();
  final user = AuthService().currentUser();

  void _onConfirm() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState?.value;

      try {
        final newEmail = formData?['email'];
        if (newEmail != null) {
          await authService.updateUserEmail(newEmail);
          setState(() {
            isEditing = false;
          });

          await Future.delayed(const Duration(milliseconds: 500));
          await authService.signOut();
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'A confirmation link was sent to your $newEmail\n\n'
                'Please Login again after confirming your new email address.',
              ),
              backgroundColor: Colors.green.shade600,
              duration: Duration(seconds: 5),
            ),
          );
          if (authService.currentUser() == null && mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You have been logged out.'),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()),
            );
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // content: Text(
            //   'Failed to update email. Please try again.',
            //   style: TextStyle(color: Colors.red),
            content: Text(
              'Error: ${e.toString()}',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Change Email'),
      content: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isEditing)
                Text(
                  'Current Email : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              else
                Text(
                  'New Email : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'email',
                      initialValue: user?.email ?? '',
                      readOnly: !isEditing,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Email is required',
                        ),
                        FormBuilderValidators.email(
                          errorText: 'Please enter a valid email address',
                        ),
                        FormBuilderValidators.maxLength(
                          50,
                          errorText: 'Email must not exceed 50 characters',
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(width: 1),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    icon: isEditing
                        ? Icon(
                            Icons.edit_off_outlined,
                            color: Colors.red.shade400,
                          )
                        : Icon(
                            Icons.edit_outlined,
                            color: Colors.green.shade400,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            if (isEditing)
              ElevatedButton(
                onPressed: () {
                  _onConfirm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Spacer(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    );
  }
}
