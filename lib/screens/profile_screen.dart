import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void showResumeDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Resume',
          ),

          content: const Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Icon(
                Icons.description,
                size: 60,
                color: Color(0xFF2563EB),
              ),

              SizedBox(height: 15),

              Text(
                'Deekshita_Resume.pdf',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              Text(
                'Your resume is ready to use for internship applications.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Close',
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Resume update option selected',
                    ),
                  ),
                );
              },

              icon: const Icon(
                Icons.upload_file,
              ),

              label: const Text(
                'Update',
              ),
            ),
          ],
        );
      },
    );
  }

  void showCodingProfiles(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Coding Profiles',
          ),

          content: const Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              ListTile(
                leading: Icon(
                  Icons.code,
                  color: Colors.black,
                ),
                title: Text('GitHub'),
                subtitle:
                    Text('github.com/deekshita'),
              ),

              ListTile(
                leading: Icon(
                  Icons.code,
                  color: Colors.orange,
                ),
                title: Text('LeetCode'),
                subtitle:
                    Text('leetcode.com/deekshita'),
              ),

              ListTile(
                leading: Icon(
                  Icons.business,
                  color: Colors.blue,
                ),
                title: Text('LinkedIn'),
                subtitle:
                    Text('linkedin.com/in/deekshita'),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
          'My Profile',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,

              backgroundColor:
                  Color(0xFFEFF6FF),

              child: Icon(
                Icons.person,
                size: 55,
                color: Color(0xFF2563EB),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Deekshita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'B.Tech CSE • 3rd Year',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 30),

            _profileTile(
              context,
              Icons.school_outlined,
              'College',
              'BVRIT Hyderabad',
            ),

            _profileTile(
              context,
              Icons.code,
              'Skills',
              'Java • Python • SQL • Flutter',
            ),

            _profileTile(
              context,
              Icons.description_outlined,
              'Resume',
              'View / Update Resume',
              onTap: () =>
                  showResumeDialog(context),
            ),

            _profileTile(
              context,
              Icons.link,
              'Coding Profiles',
              'GitHub • LinkedIn • LeetCode',
              onTap: () =>
                  showCodingProfiles(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin:
            const EdgeInsets.only(bottom: 12),

        padding:
            const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF2563EB),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color:
                          Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            if (onTap != null)
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}