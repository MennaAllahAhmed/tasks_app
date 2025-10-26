import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lec3/class/elements.dart';
import 'package:lec3/widgets/category.dart';
import 'package:lec3/widgets/choose.dart';
import 'package:lec3/widgets/text_filed_category.dart';

class CreatTask extends StatefulWidget {
  final Elements? task;
  const CreatTask({super.key, this.task});

  @override
  State<CreatTask> createState() => _CreatTaskState();
}

class _CreatTaskState extends State<CreatTask> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController assignedToController = TextEditingController();
  final TextEditingController name = TextEditingController();

  List<String> state = [
    'Pending',
    'In Progress',
    'Finished',
    'Cancelled',
    'Stucked',
  ];

  String title = 'Task Status';
  bool isCheack = false;
  late final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descriptionController.text = widget.task!.sub;
      assignedToController.text = widget.task!.assigned;
      statusController.text = widget.task!.state;
      name.text = widget.task!.name;

      dateFromController.text = dateFormat.format(widget.task!.dateTimeFrom);
      if (widget.task!.dateTimeTo != null) {
        dateToController.text = dateFormat.format(widget.task!.dateTimeTo!);
      }

      title = widget.task!.state;
      isCheack = widget.task!.dateTimeTo == null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Create Task' : 'Edit Task'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Task',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
              ),
            ),
            Category(
              title: 'Task Title',
              subTitle: 'Title',
              controller: titleController,
              isRequired: true,
            ),
            Category(
              title: 'Description',
              subTitle: 'Description',
              controller: descriptionController,
              isRequired: true,
            ),
            Category(
              title: 'Date From',
              subTitle: 'Date From',
              controller: dateFromController,
              isRequired: true,
            ),
            Row(
              children: [
                Checkbox(
                  value: isCheack,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheack = value!;
                      if (isCheack) dateToController.clear();
                    });
                  },
                ),
                const Text('Currently work on task'),
              ],
            ),
            if (!isCheack)
              Category(
                title: 'Date To',
                subTitle: 'Date To',
                controller: dateToController,
                isRequired: true,
              ),

            Category(
              title: 'Task Status',
              subTitle: title,
              controller: statusController,
              isRequired: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (String element in state)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          title = element;
                          statusController.text = element;
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: Text(element),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: title == element
                            ? Colors.green
                            : Colors.blue,
                      ),
                    ),
                ],
              ),
            ),
            if (title == 'Stucked')
              TextFiledCategory(subTitle: 'Reasons for Stuck', name: name),
            Choose(
              assignedToController: assignedToController,
              isRequired: true,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Elements task = Elements(
                      title: titleController.text,
                      sub: descriptionController.text,
                      assigned: assignedToController.text,
                      dateTimeFrom: dateFormat.parse(dateFromController.text),
                      dateTimeTo: dateToController.text.isNotEmpty
                          ? dateFormat.parse(dateToController.text)
                          : null,
                      state: statusController.text,
                      name: name.text,
                    );

                    Navigator.pop(context, task);
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
