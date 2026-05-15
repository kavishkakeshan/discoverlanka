import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Userprofileaccinfo extends StatefulWidget {
  const Userprofileaccinfo({super.key});

  @override
  State<Userprofileaccinfo> createState() => _UserprofileaccinfoState();
}

class _UserprofileaccinfoState extends State<Userprofileaccinfo> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormBuilderState>();
  final authService = AuthService();
  final user = AuthService().currentUser();

  void _onConfirm() async{
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState?.value;

      try {
        final updatedMetadata = {
          'first_name': formData?['first_name'],
          'last_name': formData?['last_name'],
          'date_of_birth': formData?['dob'],
          'address': formData?['address'],
        };
        authService.updateUserMetadata(updatedMetadata);
        setState(() {
          isEditing = false;
        });
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User metadata updated successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error updating user metadata: $e',
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
      title: Row(
        children: [
          Text('Account Details'),
          Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
                
              });
            },
            icon: isEditing ? Icon(Icons.note_add_outlined, color: Colors.red.shade400) : Icon(Icons.edit_square, color: Colors.green.shade400),
          ),
        ],
      ),
      content: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'First Name : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'first_name',
                initialValue: user?.userMetadata?['first_name'] ?? '',
                readOnly: !isEditing,
              ),
              SizedBox(height: 10),
              Text(
                'Last Name : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'last_name',
                initialValue: user?.userMetadata?['last_name'] ?? '',
                readOnly: !isEditing,
              ),
              SizedBox(height: 10),
              Text(
                'Date of Birth : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FormBuilderTextField(
                name: 'dob',
                initialValue: user?.userMetadata?['date_of_birth'] ?? '',
                readOnly: !isEditing,
              ),
              SizedBox(height: 10),
              Text('Address : ', style: TextStyle(fontWeight: FontWeight.bold)),
              FormBuilderTextField(
                name: 'address',
                initialValue: user?.userMetadata?['address'] ?? '',
                readOnly: !isEditing,
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
