import 'package:flutter/material.dart';
import '../models/internship.dart';

class ApplicationDetailsScreen
    extends StatelessWidget {

  final Internship internship;

  const ApplicationDetailsScreen({
    super.key,
    required this.internship,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF7F9FC),
        elevation: 0,

        title: const Text(
          'Application Details',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,

                    decoration:
                        BoxDecoration(
                      color:
                          const Color(0xFFEFF6FF),
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: const Icon(
                      Icons.business,
                      size: 35,
                      color:
                          Color(0xFF2563EB),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    internship.company,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    internship.role,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    internship.location,
                    style: TextStyle(
                      color:
                          Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Application Information',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _infoCard(
              Icons.calendar_today,
              'Applied Date',
              internship.appliedDate,
            ),

            _infoCard(
              Icons.event,
              'Deadline',
              internship.deadline,
            ),

            _infoCard(
              Icons.flag_outlined,
              'Current Status',
              internship.status,
            ),

            const SizedBox(height: 25),

            const Text(
              'Application Timeline',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _timelineItem(
              'Applied',
              true,
              'Application submitted',
            ),

            _timelineItem(
              'Online Assessment',
              internship.status ==
                      'Interview' ||
                  internship.status ==
                      'Selected',
              'Assessment stage',
            ),

            _timelineItem(
              'Technical Interview',
              internship.status ==
                      'Interview' ||
                  internship.status ==
                      'Selected',
              'Technical interview',
            ),

            _timelineItem(
              'Final Decision',
              internship.status ==
                  'Selected',
              internship.status ==
                      'Selected'
                  ? 'Selected'
                  : 'Waiting for result',
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 10),

      padding:
          const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(14),
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF2563EB),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: TextStyle(
                  color:
                      Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timelineItem(
    String title,
    bool completed,
    String subtitle,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Column(
          children: [
            Container(
              width: 30,
              height: 30,

              decoration: BoxDecoration(
                color: completed
                    ? const Color(
                        0xFF2563EB,
                      )
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),

              child: Icon(
                completed
                    ? Icons.check
                    : Icons.circle_outlined,
                size: 18,
                color: completed
                    ? Colors.white
                    : Colors.grey,
              ),
            ),

            Container(
              width: 2,
              height: 55,
              color: Colors.grey.shade300,
            ),
          ],
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(
              top: 3,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    color: completed
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}