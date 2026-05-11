import 'package:discoverlanka/ui/basepage.dart';
import 'package:discoverlanka/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

void main() async {
  await Supabase.initialize(
    anonKey: "sb_publishable_LwsWXQkVbyWqaSk_eIXA0A_pGhe8gxS",
    url: "https://cgsvautrxuvanedsjmou.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discover Lanka',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder <AuthState>(

        // Check the user login or not when the app is opened
        // If the user is logged in, it will navigate to the BasePage, otherwise it will navigate to the Loginpage
        stream: supabase.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final session = supabase.auth.currentSession;
          if(session != null) {
            return const Dashboard();
          } else {
            return const BasePage();
          }
        },
      ),
    );
  }
}
