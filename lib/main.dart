import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

import 'models/internship.dart';
import 'screens/dashboard_screen.dart';
import 'screens/applications_screen.dart';
import 'screens/add_application_screen.dart';
import 'screens/saved_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/application_details_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const InternshipHub());
}

class InternshipHub extends StatelessWidget {
  const InternshipHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InternshipHub',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor:
            const Color(0xFFF7F9FC),
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return const InternshipHome();
        }

        return const LoginLandingScreen();
      },
    );
  }
}

class LoginLandingScreen extends StatelessWidget {
  const LoginLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Icon(
                      Icons.work_rounded,
                      size: 80,
                      color: Color(0xFF2563EB),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'InternshipHub',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Track your internships, applications '
                      'and career journey in one place.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InternshipHome extends StatefulWidget {
  const InternshipHome({super.key});

  @override
  State<InternshipHome> createState() =>
      _InternshipHomeState();
}

class _InternshipHomeState extends State<InternshipHome> {
  int currentIndex = 0;

  final List<Internship> internships = [
    Internship(
      company: 'Google',
      role: 'Software Engineering Intern',
      location: 'Bengaluru',
      appliedDate: '20 Sep 2026',
      deadline: '30 Sep 2026',
      status: 'Interview',
      isSaved: false,
    ),
    Internship(
      company: 'Adobe',
      role: 'Software Developer Intern',
      location: 'Noida',
      appliedDate: '18 Sep 2026',
      deadline: '05 Oct 2026',
      status: 'Applied',
      isSaved: true,
    ),
    Internship(
      company: 'UBS',
      role: 'Technology Summer Intern',
      location: 'Hyderabad',
      appliedDate: '10 Sep 2026',
      deadline: '25 Sep 2026',
      status: 'Selected',
      isSaved: false,
    ),
    Internship(
      company: 'Amazon',
      role: 'SDE Intern',
      location: 'Bengaluru',
      appliedDate: '05 Sep 2026',
      deadline: '28 Sep 2026',
      status: 'Applied',
      isSaved: true,
    ),
  ];

  void openAddApplication() async {
    final Internship? newInternship =
        await Navigator.push<Internship>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AddApplicationScreen(),
      ),
    );

    if (newInternship != null) {
      setState(() {
        internships.add(newInternship);
      });
    }
  }

  void openDetails(Internship internship) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ApplicationDetailsScreen(
          internship: internship,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(
        internships: internships,
        onInternshipTap: openDetails,
      ),
      ApplicationsScreen(
        internships: internships,
        onInternshipTap: openDetails,
      ),
      SavedScreen(
        internships: internships,
        onInternshipTap: openDetails,
      ),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton:
          currentIndex == 1
              ? FloatingActionButton(
                  onPressed: openAddApplication,
                  backgroundColor:
                      const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                )
              : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Applications',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}