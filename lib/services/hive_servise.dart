import 'package:hive/hive.dart';
import 'package:lec3/class/elements.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._internal();
  static final HiveService _instance = HiveService._internal();
  static HiveService get instance => _instance;
  late Box<Elements> _hiveBox;
  final String _databaseName = 'Tasks';
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.registerAdapter<Elements>(ElementsAdapter());
    _hiveBox = await Hive.openBox<Elements>(
      _databaseName,
      path: directory.path,
    );
  }

  List<Elements> get tasks => _hiveBox.values.toList();
  Future<void> addTask(Elements task) async {
    try {
      await _hiveBox.add(task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editTask(Elements task, int index) async {
    try {
      await _hiveBox.putAt(index, task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(int index) async {
    try {
      await _hiveBox.delete(index);
    } catch (e) {
      rethrow;
    }
  }

  Elements? getTask(int index) {
    try {
      _hiveBox.getAt(index);
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
