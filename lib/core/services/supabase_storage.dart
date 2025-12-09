import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

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
  Future<String> uploadFile(File file, String path) async {
    String fileName = file.path;
    String extensionName = b.extension(file.path);
    var result = await supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    return result;
  }
}
