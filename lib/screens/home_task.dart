import 'package:flutter/material.dart';
import 'package:lec3/class/elements.dart';
import 'package:lec3/screens/creat_task.dart';
import 'package:lec3/services/hive_servise.dart';
import 'package:lec3/widgets/body_task.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({super.key});

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> {
  List<Elements> tasks = HiveService.instance.tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Tasks'))),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: const Card(
                    color: Colors.blue,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                  secondaryBackground: const Card(
                    color: Colors.red,

                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      final updatedTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CreatTask(task: tasks[index]);
                          },
                        ),
                      );
                      if (updatedTask != null) {
                        final taskKey = HiveService.instance.getKeyAt(index);
                        if (taskKey != null) {
                          await HiveService.instance.editTask(updatedTask, taskKey);
                          setState(() {
                            tasks[index] = updatedTask;
                          });
                        }
                      }
                      return false;
                    } else if (direction == DismissDirection.endToStart) {
                      final taskKey = HiveService.instance.getKeyAt(index);
                      if (taskKey != null) {
                        await HiveService.instance.deleteTask(taskKey);
                        setState(() {
                          tasks.removeAt(index);
                        });
                      }
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Icon(Icons.delete),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return true;
                    }
                    return false;
                  },

                  child: BodyTask(task: tasks[index]),
                );
              },
            ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () async {
            final task = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CreatTask();
                },
              ),
            );
            if (task != null && task is Elements) {
              await HiveService.instance.addTask(task);
              tasks.add(task);
              setState(() {});
            }
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
