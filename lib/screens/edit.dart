import 'package:flutter/material.dart';
import 'package:notes/screens/home.dart';

import '../model/sqflite.dart';

class EditNotes extends StatefulWidget {
  final note;
  final title;
  final color;
  final id;

  EditNotes({super.key, this.note, this.title, this.color, this.id});

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController note = TextEditingController();

  TextEditingController title = TextEditingController();

  TextEditingController color = TextEditingController();

  Sqflite sqflite = Sqflite();

  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    color.text = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Notes"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                children: [
                  TextFormField(
                    controller: note,
                    maxLength: 15,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Enter content";
                    }
                    return null;
                  },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        hintText: "Note",),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: title,
                    maxLength: 15,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter content";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Title",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: color,
                    maxLength: 15,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter content";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Color",
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color(0xFF48907E),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      if(!formState.currentState!.validate()){
                        return;
                      }
                      int response = await sqflite.update(
                          "tableNotes",
                          {
                            "note": note.text,
                            "title": title.text,
                            "color": color.text,
                          },
                          "id = ${widget.id}");
                      if (response >= 1) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (ctx) => HomeTwo()),
                            (route) => false);
                      }
                      print("response ============== \n$response");
                    },
                    child: const Text("Add Note"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
