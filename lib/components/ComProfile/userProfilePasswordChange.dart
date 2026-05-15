import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserprofilePasswordchange extends StatefulWidget {
  const UserprofilePasswordchange({super.key});

  @override
  State<UserprofilePasswordchange> createState() =>
      _UserprofilePasswordchangeState();
}

class _UserprofilePasswordchangeState extends State<UserprofilePasswordchange> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  final TextEditingController passwordController = TextEditingController();
  final currentUser = AuthService().currentUser();

  void _onConfirm() async {
    final authService = AuthService();
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;
      final String currentPassword = formData['currentPassword'];
      final String newPassword = formData['newPassword'];

      try {
        // Reauthenticate the user to verify the current password
        await authService.signInWithEmailPassword(
          currentUser!.email!,
          currentPassword,
        );

        // If reauthentication succeeds, update to the new password
        await authService.updateUserPassword(newPassword);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated successfully!')),
          );
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Verification failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Change Password'),
      content: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter Current Password : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'currentPassword',
                obscureText: _obscureCurrent,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureCurrent = !_obscureCurrent;
                      });
                    },
                    icon: _obscureCurrent
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Current Password is required',
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Text(
                'Enter New Password : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'newPassword',
                obscureText: _obscureNew,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureNew = !_obscureNew;
                      });
                    },
                    icon: _obscureNew
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Password is required',
                  ),
                  FormBuilderValidators.minLength(
                    6,
                    errorText: 'Password must be at least 6 characters',
                  ),
                  FormBuilderValidators.maxLength(
                    30,
                    errorText: 'Password must not exceed 30 characters',
                  ),
                  FormBuilderValidators.match(
                    RegExp(r'(?=.*[A-Z])'), // Wrap with RegExp()
                    errorText: 'Must contain at least one uppercase letter',
                  ),
                  FormBuilderValidators.match(
                    RegExp(r'(?=.*[a-z])'), // Wrap with RegExp()
                    errorText: 'Must contain at least one lowercase letter',
                  ),
                  FormBuilderValidators.match(
                    RegExp(r'(?=.*\d)'), // Wrap with RegExp()
                    errorText: 'Must contain at least one number',
                  ),
                  FormBuilderValidators.match(
                    RegExp(
                      r'(?=.*[@$!%*?&#^()_+\-=\[\]{};:"\\|,.<>\/?])',
                    ), // Wrap with RegExp()
                    errorText: 'Must contain at least one special character',
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Text(
                'Confirm New Password : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'confirmNewPassword',
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirm = !_obscureConfirm;
                      });
                    },
                    icon: _obscureConfirm
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Please confirm your new password',
                  ),
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
      actions: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _onConfirm();
                Navigator.of(context).pop();
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
