import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/branch_selector_screen.dart';
import 'screens/home_screen.dart';
import 'screens/price_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xFFFFF2F6), // light pink background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA1356A),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFA1356A),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/branch-selector': (context) => BranchSelectorScreen(),
        '/home': (context) => HomeScreen(),
        '/price': (context) => PriceScreen(),
        '/orders': (context) => OrdersScreen(),
        '/profile': (context) => ProfileScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/admin-dashboard': (context) => AdminDashboard(),
      },
    );
  }
}
