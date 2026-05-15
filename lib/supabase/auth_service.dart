import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String dateOfBirth,
    String address,
  ) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth,
        'address': address,
      },
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  User? currentUser() {
    final session = _supabase.auth.currentSession;
    return session?.user;
  }

  Future<void> updateUserMetadata(Map<String, dynamic> metadata) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(data: metadata));
    } catch (e) {
      throw Exception('Failed to update user metadata: $e');
    }
  }

  Future<void> updateUserEmail(String newEmail) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(email: newEmail));
    } catch (e) {
      throw Exception('Failed to update user email: $e');
    }
  }

  Future<void> updateUserPassword(String newPassword) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(password: newPassword));
    } catch (e) {
      throw Exception('Failed to update user password: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      await _supabase.rpc('delete_current_user');
      await _supabase.auth.signOut();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  Future<void> refreshUserDetails() async {
    try {
      final response = await _supabase.auth.getUser();
    } catch (e) {
      throw Exception('Failed to refresh user details: $e');
    }
  }
}
