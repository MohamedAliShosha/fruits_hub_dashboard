import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase supabase;

  static initSupabase() async {
    supabase = await Supabase.initialize(
      // getting url and key from project at supabase account
      anonKey: kSupabaseApiKey,
      url: kSupabaseUrl,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) {}
}
