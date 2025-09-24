// lib/screens/alerts_screen.dart

import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  final Function() onViewOnMap; // <-- RECEIVE THE FUNCTION
  const AlertsScreen({super.key, required this.onViewOnMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verified Alerts')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          AlertCard(
            title: 'Flood Warning – Kakinada Coast',
            severity: 'High',
            color: Colors.red,
            message: 'Move to higher ground; avoid coastal area near the fishing harbor.',
            source: 'Verified by Synapse • 10:45 AM',
            onPressed: onViewOnMap, // <-- PASS IT TO THE CARD
          ),
          AlertCard(
            title: 'Coastal Surge Advisory – Visakhapatnam',
            severity: 'Medium',
            color: Colors.orange,
            message: 'Secure small boats and fishing equipment. High tides expected.',
            source: 'Verified by Synapse • 11:30 AM',
            onPressed: onViewOnMap, // <-- PASS IT TO THE CARD
          ),
        ],
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final String title;
  final String severity;
  final Color color;
  final String message;
  final String source;
  final Function() onPressed; // <-- RECEIVE THE FUNCTION

  const AlertCard({
    super.key,
    required this.title,
    required this.severity,
    required this.color,
    required this.message,
    required this.source,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(severity, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(message),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(source, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                TextButton(
                  onPressed: onPressed, // <-- USE THE FUNCTION HERE
                  child: const Text('View on Map'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}