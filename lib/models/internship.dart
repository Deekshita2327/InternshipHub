class Internship {
  String company;
  String role;
  String location;
  String appliedDate;
  String deadline;
  String status;
  bool isSaved;

  Internship({
    required this.company,
    required this.role,
    required this.location,
    required this.appliedDate,
    required this.deadline,
    required this.status,
    this.isSaved = false,
  });
}