import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/on_generate_route.dart';
import 'package:fruits_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    // getting url and key from project at supabase account
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndmZnlhZ2dva2J1eHhlbnd6ZW9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjUyMTgzOTMsImV4cCI6MjA4MDc5NDM5M30.KWl7qGmS3u4z1r13mdJg-Jhc9m9TWWtoFcnZJN5A3S0',
    url: 'https://wffyaggokbuxxenwzeoe.supabase.co',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  setupGetIt();
  runApp(const FruitsHubDashboard());
}

class FruitsHubDashboard extends StatelessWidget {
  const FruitsHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
