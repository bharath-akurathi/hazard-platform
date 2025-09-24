import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  Stream<List<Map<String, dynamic>>> getReportsStream() {
    return _client.from('hazard_reports').stream(primaryKey: ['id']).order('created_at');
  }

  Future<void> addReport({
    required String title,
    required String hazardType,
    required String address,
    required double latitude,
    required double longitude,
    required String description,
    File? imageFile,
  }) async {
    // ... (this function is likely correct, no changes needed here)
  }

  Future<void> upvoteReport(int reportId) async { // <-- ENSURE THIS IS INT
    await _client.rpc('increment_upvote', params: {'report_id': reportId});
  }
}