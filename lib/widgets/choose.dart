import 'package:flutter/material.dart';
import 'package:lec3/widgets/text_filed_category.dart';

class Choose extends StatefulWidget {
  final TextEditingController assignedToController;

  const Choose({
    required this.assignedToController, // ignore: always_put_required_named_parameters_first
    required bool isRequired, super.key,
  });

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Assigned to you'),
          leading: Radio(
            value: 'Assigned to you',
            // ignore: deprecated_member_use
            groupValue: selected,
            // ignore: deprecated_member_use
            onChanged: (value) {
              setState(() {
                selected = value!;
                widget.assignedToController.text = 'You';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Assigned to someone else'),
          leading: Radio(
            value: 'Assigned to someone else',
            // ignore: deprecated_member_use
            groupValue: selected,
            // ignore: deprecated_member_use
            onChanged: (value) {
              setState(() {
                selected = value!;
              });
            },
          ),
        ),
        if (selected == 'Assigned to someone else')
          TextFiledCategory(
            subTitle: 'Assigned To',
            name: widget.assignedToController,
          ),
      ],
    );
  }
}
