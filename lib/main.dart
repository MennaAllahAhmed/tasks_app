import 'package:flutter/material.dart';
import 'package:lec3/screens/home_task.dart';
import 'package:lec3/services/hive_servise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.instance.init();
  runApp(const Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomeTask());
  }
}
