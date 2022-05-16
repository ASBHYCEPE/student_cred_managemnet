import 'package:cred_management/models/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String _dbName = 'student.db';
  final int _version = 1;
  Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_dbName);

    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbFilePath = await getDatabasesPath();
    final path = join(dbFilePath, dbName);

    return openDatabase(path, version: _version, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const String sql = '''CREATE TABLE student(
      studentID VARCHAR(50) PRIMARY KEY,
      firstName VARCHAR(255) NOT NULL,
      lastName VARCHAR(255) NOT NULL,
      middleName VARCHAR(255) NOT NULL,
      admissionYear VARCHAR(6) NOT NULL,
      course VARCHAR(255) NOT NULL,
      department VARCHAR(255) NOT NULL,
      filingDate DATETIME DEFAULT CURRENT_TIMESTAMP
    );''';

    return await db.execute(sql);
  }

  Future<List<Student>?> getAllStudent() async {
    final db = await database;

    final List<Map<String, dynamic>> data =
        await db.query('student', orderBy: 'firstName ASC');

    if (data.isEmpty) {
      return null;
    }

    return List.generate(data.length, (index) => Student.fromJson(data[index]));
  }

  Future<int> addStudent(Student student) async {
    final db = await database;

    return db.rawInsert('''INSERT INTO 
        student(
          studentId, 
          firstName, 
          lastName, 
          middleName, 
          admissionYear, 
          course, 
          department) 
          VALUES(?,?,?,?,?,?,?);''', [
      student.studentID,
      student.firstName,
      student.lastName,
      student.middleName,
      student.admissionYear,
      student.course,
      student.department
    ]);
  }

  Future<int> updateStudent(Student student) async {
    final db = await database;
    return await db.rawUpdate('''
          UPDATE student SET 
          firstName = ?, 
          lastName = ?, 
          middleName = ?, 
          admissionYear = ?, 
          course = ?, 
          department = ?
          WHERE studentId = ?
          ''', [
      student.firstName,
      student.lastName,
      student.middleName,
      student.admissionYear,
      student.course,
      student.department,
      student.studentID
    ]);
  }

  Future<int> deleteStudent(Student student) async {
    final db = await database;

    return db.delete('student',
        where: 'studentId = ?', whereArgs: [student.studentID]);
  }
}
