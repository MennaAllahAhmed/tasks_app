import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String title;
  final String subTitle;
  final TextEditingController controller;
  final bool isRequired;
  final String? errorText;

  const Category({
    required this.title, // ignore: always_put_required_named_parameters_first
    required this.subTitle, // ignore: always_put_required_named_parameters_first
    required this.controller, super.key,
    this.isRequired = false,
    this.errorText,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 4),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.subTitle,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon:
                        widget.title == 'Date From' || widget.title == 'Date To'
                        ? IconButton(
                            onPressed: () async {
                              date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                setState(() {
                                  widget.controller.text =
                                      '${date!.day}/${date!.month}/${date!.year}';
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range),
                          )
                        : null,
                    suffixIcon: widget.title == 'Task Status'
                        ? const Icon(Icons.arrow_drop_down)
                        : null,
                  ),
                  maxLines: widget.title == 'Description' ? 4 : 1,
                  validator: (value) {
                    if (widget.isRequired && (value == null || value.isEmpty)) {
                      return 'This field is requried';
                    }
                    return null;
                  },
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
