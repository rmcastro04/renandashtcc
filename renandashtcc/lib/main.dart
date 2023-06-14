import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/dashboard.dart';

import 'package:supabase_flutter/supabase_flutter.dart';



void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: 'https://htfwdroehxbmbyqkkras.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh0Zndkcm9laHhibWJ5cWtrcmFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUwNjY3NDMsImV4cCI6MjAwMDY0Mjc0M30.xOJO1VBSUJ1pqiF-o1b6szL3anmGcq_7eudLCtDngh4',
  );

 
     final data = await Supabase.instance.client.from('dados_finais')
   .select('*')
    .eq('id', '27');
    print(data);
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive Dashboard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: MaterialColor(
            primaryColorCode,
            <int, Color>{
              
            },
          ),
          scaffoldBackgroundColor: Color.fromRGBO(248, 249, 251, 0.89),//cor do fundo
          fontFamily: 'IBMPlexSans',
          brightness: Brightness.dark),
      home: DashBoard(),
    );
  }
}
