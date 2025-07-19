import 'package:flutter/material.dart';
import 'package:lms/screens/admin_accounts_screen.dart';
import 'package:lms/screens/admin_feedback_screen.dart';
import 'package:lms/screens/admin_reports_screen.dart';
import 'package:lms/screens/login_screen.dart';
import 'package:lms/screens/register_screen.dart';
import 'package:lms/screens/branch_selector_screen.dart';
import 'package:lms/screens/home_screen.dart';
import 'package:lms/screens/price_screen.dart';
import 'package:lms/screens/orders_screen.dart';
import 'package:lms/screens/profile_screen.dart';
import 'package:lms/screens/schedule_screen.dart';
import 'package:lms/screens/admin_dashboard.dart';
import 'package:lms/screens/admin_services_screen.dart';
import 'package:lms/screens/admin_orders_screen.dart';
import 'package:lms/screens/admin_prices_screen.dart';
import 'package:lms/screens/chat_screen.dart';
import 'package:lms/screens/notifications_screen.dart';
import 'package:lms/screens/rate_services_screen.dart';
import 'package:lms/screens/privacy_policy_screen.dart';
import 'package:lms/screens/terms_conditions_screen.dart';
import 'package:lms/screens/transaction_history_screen.dart';
import 'package:lms/screens/help_support_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFFF2F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/branch-selector': (context) => BranchSelectorScreen(),
        '/home': (context) => HomeScreen(),
        '/price': (context) => PriceScreen(),
        '/orders': (context) => OrdersScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/chat': (context) => const ChatScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/admin-dashboard': (context) => const AdminDashboard(),
        '/admin-services': (context) => const AdminServicesScreen(),
        '/admin-orders': (context) => const AdminOrdersScreen(),
        '/admin-prices': (context) => const AdminPricesScreen(),
        '/admin-reports': (context) => AdminReportsScreen(),
        '/admin-accounts': (context) => const AdminAccountsScreen(),
        '/admin-feedback': (context) => const AdminFeedbackScreen(),
        '/rate': (context) => const RateServicesScreen(),
        '/privacy': (context) => const PrivacyPolicyScreen(),
        '/terms': (context) => const TermsConditionsScreen(),
        '/transaction_history': (context) => const TransactionHistoryScreen(),
        '/help_support': (context) => const HelpSupportScreen(),
      },
    );
  }
}
