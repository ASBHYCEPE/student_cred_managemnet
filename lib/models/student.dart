class Student {
  final String studentID;
  final String firstName;
  final String lastName;
  final String middleName;
  final String admissionYear;
  final String course;
  final String department;
  final DateTime? filingDate;

  Student(
      {required this.studentID,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.admissionYear,
      required this.department,
      required this.course,
      this.filingDate});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      studentID: json['studentID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      admissionYear: json['admissionYear'],
      course: json['course'],
      department: json['department'],
      filingDate: DateTime.parse(json['filingDate']));

  Map<String, dynamic> toJson() => {
        'studentID': studentID,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'admissionYear': admissionYear,
        'course': course,
        'department': department,
        'filingDate': filingDate!.toIso8601String()
      };
}
