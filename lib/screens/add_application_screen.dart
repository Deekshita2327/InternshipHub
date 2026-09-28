import 'package:flutter/material.dart';
import '../models/internship.dart';

class AddApplicationScreen extends StatefulWidget {
  const AddApplicationScreen({super.key});

  @override
  State<AddApplicationScreen> createState() =>
      _AddApplicationScreenState();
}

class _AddApplicationScreenState
    extends State<AddApplicationScreen> {

  final companyController = TextEditingController();
  final roleController = TextEditingController();
  final locationController = TextEditingController();

  String status = 'Applied';

  DateTime? appliedDate;
  DateTime? deadline;

  @override
  void dispose() {
    companyController.dispose();
    roleController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> selectDate(bool isAppliedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked == null) {
      return;
    }

    setState(() {
      if (isAppliedDate) {
        appliedDate = picked;
      } else {
        deadline = picked;
      }
    });
  }

  String formatDate(DateTime? date) {
    if (date == null) {
      return 'Not selected';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  void addApplication() {
    // Check company name
    if (companyController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the company name'),
        ),
      );
      return;
    }

    // Check role
    if (roleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the job role'),
        ),
      );
      return;
    }

    // Check location
    if (locationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the location'),
        ),
      );
      return;
    }

    final Internship newInternship = Internship(
      company: companyController.text.trim(),
      role: roleController.text.trim(),
      location: locationController.text.trim(),
      appliedDate: formatDate(appliedDate),
      deadline: formatDate(deadline),
      status: status,
      isSaved: false,
    );

    // Return the new internship to main.dart
    Navigator.pop(context, newInternship);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF111827),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Add Application',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Internship Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Add your internship application details',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            // Company
            const Text(
              'Company Name *',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: companyController,
              decoration: InputDecoration(
                hintText: 'e.g. Google',
                prefixIcon: const Icon(
                  Icons.business_outlined,
                  color: Color(0xFF2563EB),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Role
            const Text(
              'Job Role *',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: roleController,
              decoration: InputDecoration(
                hintText: 'e.g. Software Engineering Intern',
                prefixIcon: const Icon(
                  Icons.work_outline,
                  color: Color(0xFF2563EB),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Location
            const Text(
              'Location *',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'e.g. Hyderabad',
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFF2563EB),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Applied Date
            const Text(
              'Application Date',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: () => selectDate(true),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xFF2563EB),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      formatDate(appliedDate),
                      style: TextStyle(
                        color: appliedDate == null
                            ? Colors.grey.shade600
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Deadline
            const Text(
              'Application Deadline',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: () => selectDate(false),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.event_outlined,
                      color: Color(0xFF2563EB),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      formatDate(deadline),
                      style: TextStyle(
                        color: deadline == null
                            ? Colors.grey.shade600
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Status
            const Text(
              'Application Status',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: status,
                  isExpanded: true,

                  items: const [
                    DropdownMenuItem(
                      value: 'Applied',
                      child: Text('Applied'),
                    ),
                    DropdownMenuItem(
                      value: 'Interview',
                      child: Text('Interview'),
                    ),
                    DropdownMenuItem(
                      value: 'Selected',
                      child: Text('Selected'),
                    ),
                    DropdownMenuItem(
                      value: 'Rejected',
                      child: Text('Rejected'),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        status = value;
                      });
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Add button
            SizedBox(
              width: double.infinity,
              height: 56,

              child: ElevatedButton.icon(
                onPressed: addApplication,

                icon: const Icon(
                  Icons.add,
                ),

                label: const Text(
                  'Add Application',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF2563EB),

                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}