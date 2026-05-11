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
    final session =  _supabase.auth.currentSession;
    return session?.user;
  }
}
