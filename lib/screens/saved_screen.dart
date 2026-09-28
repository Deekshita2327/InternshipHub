import 'package:flutter/material.dart';
import '../models/internship.dart';
import '../widgets/internship_card.dart';

class SavedScreen extends StatelessWidget {
  final List<Internship> internships;
  final Function(Internship) onInternshipTap;

  const SavedScreen({
    super.key,
    required this.internships,
    required this.onInternshipTap,
  });

  @override
  Widget build(BuildContext context) {
    final saved = internships
        .where(
          (internship) =>
              internship.isSaved,
        )
        .toList();

    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF7F9FC),
        elevation: 0,

        title: const Text(
          'Saved Internships',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: saved.isEmpty
          ? const Center(
              child: Text(
                'No saved internships yet',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(20),

              itemCount: saved.length,

              itemBuilder: (context, index) {
                final internship =
                    saved[index];

                return InternshipCard(
                  internship: internship,
                  onTap: () =>
                      onInternshipTap(
                    internship,
                  ),
                );
              },
            ),
    );
  }
}