import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserProfilePopups {
  static void showAccountDetailsPopup(BuildContext context) {
    final user = AuthService().currentUser();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Account Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('First Name : '),
              FormBuilderTextField(
                name: 'first_name',
                initialValue: user?.userMetadata?['first_name'] ?? '',
                readOnly: true,
              ),
              Text('Last Name : '),
              FormBuilderTextField(
                name: 'last_name',
                initialValue: user?.userMetadata?['last_name'] ?? '',
                readOnly: true,
              ),
              
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
