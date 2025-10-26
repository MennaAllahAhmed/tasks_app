import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lec3/class/elements.dart';

class BodyTask extends StatelessWidget {
  final Elements task;
  final dateFormat = DateFormat('dd/MM/yyyy');
  BodyTask({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                task.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(task.sub, style: const TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  const Icon(Icons.date_range),
                  const Text(
                    ' From ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    dateFormat.format(task.dateTimeFrom),
                    style: const TextStyle(fontSize: 15),
                  ),
                  if (task.dateTimeTo != null) ...[
                    const Text(
                      ' To ',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      dateFormat.format(task.dateTimeTo!),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Assigned to : ${task.assigned}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Chip(
                label: Text(task.state),
                backgroundColor: Colors.blueAccent,
              ),
            ),
            if (task.state == 'Stucked')
              Text(
                'Reasons for stuck : ${task.name}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
