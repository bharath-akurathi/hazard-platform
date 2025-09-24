import 'package:latlong2/latlong.dart';
import 'dart:io'; // Make sure this import is present

// Ensure your enums are defined
enum ReportStatus { Pending, Verified, Low }
enum HazardType { Flood, Cyclone, StormSurge, CoastalErosion, Others }

class Report {
  final int id; // <-- MUST BE INT
  final String title;
  final String? description;
  final String hazardType;
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool? isVerified;
  final String? imageUrl;
  final DateTime createdAt;
  final int upvotes; // <-- Add this to match schema

  Report({
    required this.id,
    required this.title,
    this.description,
    required this.hazardType,
    this.latitude,
    this.longitude,
    this.address,
    this.isVerified,
    this.imageUrl,
    required this.createdAt,
    required this.upvotes,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'] as int, // <-- PARSE AS INT
      title: json['title'] ?? 'No Title',
      description: json['description'],
      hazardType: json['hazard_type'] ?? 'Other',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'],
      isVerified: json['is_verified'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
      upvotes: json['upvotes'] ?? 0,
    );
  }

  // Helper to create LatLng
  LatLng get latLng => LatLng(latitude ?? 0.0, longitude ?? 0.0);
}