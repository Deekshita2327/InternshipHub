import 'package:flutter/material.dart';
import '../models/internship.dart';
import '../widgets/statistic_card.dart';
import '../widgets/internship_card.dart';

class DashboardScreen extends StatelessWidget {
  final List<Internship> internships;
  final Function(Internship) onInternshipTap;

  const DashboardScreen({
    super.key,
    required this.internships,
    required this.onInternshipTap,
  });

  @override
  Widget build(BuildContext context) {
    final applied = internships.length;

    final interviews = internships
        .where(
          (item) =>
              item.status == 'Interview',
        )
        .length;

    final selected = internships
        .where(
          (item) =>
              item.status == 'Selected',
        )
        .length;

    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF7F9FC),
        elevation: 0,

        title: const Text(
          'InternshipHub',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    'No new notifications',
                  ),
                ),
              );
            },

            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            const Text(
              'Good Morning, Deekshita 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Track your internship journey',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: StatisticCard(
                    title: 'Applied',
                    value: '$applied',
                    icon: Icons.send_outlined,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: StatisticCard(
                    title: 'Interviews',
                    value: '$interviews',
                    icon: Icons.people_outline,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: StatisticCard(
                    title: 'Selected',
                    value: '$selected',
                    icon:
                        Icons.check_circle_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Recent Applications',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            ...internships.take(3).map(
              (internship) {
                return InternshipCard(
                  internship: internship,
                  onTap: () =>
                      onInternshipTap(
                    internship,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}