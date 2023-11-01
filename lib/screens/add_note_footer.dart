import 'package:flutter/material.dart';

import 'package:notes/screens/style.dart';

import '../color.dart';
import '../constant.dart';
import '../model/sqflite.dart';
import '../widget/add_note_color_widget.dart';
import 'home.dart';

class AddNoteFooter extends StatelessWidget {
  AddNoteFooter({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
  });

  TextEditingController color = TextEditingController();
  Sqflite sqflite = Sqflite();

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddNoteColorsWidget(),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  backgroundColor: MyColors.myWhite,
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    return;
                  }
                  int response = await sqflite.insert("tableNotes", {
                    'title': titleController.text,
                    'note': descriptionController.text,
                    'color': color.text
                  });
                  if (response >= 1) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => HomeTwo()),
                        (route) => false);
                  }
                  print("response ============== \n$response");
                },
                child: Text(
                  'Add Note',
                  style: Styles.textStyle14.copyWith(
                    color: colorNote,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
