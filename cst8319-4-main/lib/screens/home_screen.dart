import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data/scenario_data.dart';
import '../models/models.dart';
import 'session_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png', width: 40),
        ),
        title: Text(
          'Parenting Scripts',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: scenarioData.length,
        itemBuilder: (context, index) {
          final scenario = scenarioData[index];
          return ListTile(
            title: Text(scenario.title, style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
            subtitle: Text(scenario.situation, style: GoogleFonts.nunito()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionScreen(session: SessionState(scenario: scenario)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
