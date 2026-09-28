import 'package:flutter/material.dart';
import '../models/internship.dart';
import '../widgets/internship_card.dart';

class ApplicationsScreen extends StatefulWidget {
  final List<Internship> internships;
  final Function(Internship) onInternshipTap;

  const ApplicationsScreen({
    super.key,
    required this.internships,
    required this.onInternshipTap,
  });

  @override
  State<ApplicationsScreen>
      createState() =>
          _ApplicationsScreenState();
}

class _ApplicationsScreenState
    extends State<ApplicationsScreen> {

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredInternships =
        widget.internships.where((internship) {
      final company =
          internship.company.toLowerCase();

      final role =
          internship.role.toLowerCase();

      final search =
          searchText.toLowerCase();

      return company.contains(search) ||
          role.contains(search);
    }).toList();

    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF7F9FC),
        elevation: 0,

        title: const Text(
          'My Applications',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              10,
            ),

            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },

              decoration: InputDecoration(
                hintText:
                    'Search company or role...',

                prefixIcon:
                    const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: filteredInternships.isEmpty
                ? const Center(
                    child: Text(
                      'No applications found',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.all(20),

                    itemCount:
                        filteredInternships.length,

                    itemBuilder:
                        (context, index) {
                      final internship =
                          filteredInternships[index];

                      return InternshipCard(
                        internship: internship,
                        onTap: () =>
                            widget.onInternshipTap(
                          internship,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}