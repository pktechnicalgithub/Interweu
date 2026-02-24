import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/resume_provider.dart';
import 'screens/resume_upload_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ResumeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResumeUploadScreen(),
    );
  }
}
