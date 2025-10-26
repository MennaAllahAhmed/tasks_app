import 'package:flutter/material.dart';

class TextFiledCategory extends StatelessWidget {
  final TextEditingController name;
  final String subTitle;
  const TextFiledCategory({required this.subTitle, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: name,
        decoration: InputDecoration(
          hintText: subTitle,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is requried';
                    }
                    return null;
                  },
      ),
    );
  }
}
