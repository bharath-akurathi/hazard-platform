import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:synapse_citizen_app/screens/alerts_screen.dart';
import 'package:synapse_citizen_app/screens/map_screen.dart';
import 'package:synapse_citizen_app/screens/profile_screen.dart';
import 'package:synapse_citizen_app/screens/report_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vwgrfumuoovrilfbdttb.supabase.co', // Use your actual URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ3Z3JmdW11b292cmlsZmJkdHRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgxMTU4NjgsImV4cCI6MjA3MzY5MTg2OH0.6W3IohCXN12qF_u5YtlSLvbsmDxLj9g4tEfCT2gw1S4', // Use your actual anon key
  );

  runApp(const SynapseApp());
}

class SynapseApp extends StatelessWidget {
  const SynapseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Synapse',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(secondary: Colors.orange),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToMap() {
    setState(() {
      _selectedIndex = 1; // Index of MapScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    // The list of screens that correspond to the BottomNavigationBar items
    final List<Widget> screens = <Widget>[
      ReportScreen(onReportSubmitted: _navigateToMap), // <-- THE FIX IS HERE
      const MapScreen(),
      AlertsScreen(onViewOnMap: _navigateToMap),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}