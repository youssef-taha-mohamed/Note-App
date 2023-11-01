import 'package:flutter/material.dart';
import 'package:notes/screens/home.dart';

import '../model/sqflite.dart';
import 'add_note_body.dart';
import 'add_note_footer.dart';

class AddNotes extends StatefulWidget {
  AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController color = TextEditingController();

  Sqflite sqflite = Sqflite();
  bool favorite = false;
  bool isChecked = false;
  String? saveTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: backGround,
      appBar: AppBar(
        title: const Text("Add Notes"),
        //backgroundColor: mainColor,
      ),
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Form(
             key: formKey,
             child: Column(
               children: [
                 Expanded(
                   child: AddNoteBody(
                     titleController: titleController,
                     descriptionController: descriptionController,
                   ),
                 ),
                 const SizedBox(height: 20),
                 AddNoteFooter(
                   titleController: titleController,
                   descriptionController: descriptionController,
                   formKey: formKey,
                 )
               ],
             ),
           ),
         ),
       ),
      // Column(
      //   children: [
      //     Form(
      //       key: formState,
      //       child: Column(
      //         children: [
      //
      //           TextFormField(
      //             maxLength: 15,
      //             keyboardType: TextInputType.text,
      //             controller: note,
      //             textDirection: TextDirection.rtl,
      //             textInputAction: TextInputAction.done,
      //             decoration: InputDecoration(
      //                // border: OutlineInputBorder(),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide:const BorderSide(
      //                     color: Color(0xFF48907E),
      //                     width: 2.0,
      //                   ),
      //                   borderRadius: BorderRadius.circular(15),
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide:const BorderSide(
      //                     color: Color(0xFF48907E),
      //                     width: 2.0,
      //                   ),
      //                   borderRadius: BorderRadius.circular(15),
      //                 ),
      //                 label:const Text("Title Of Note",style: TextStyle(color: Colors.white),),
      //                 hintText: "Note"),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return 'Title is required';
      //               } else if (value.length > 20) {
      //                 return 'Title is too long';
      //               } else {
      //                 return null;
      //               }
      //             },
      //           ),
      //           const SizedBox(height: 10),
      //           Expanded(
      //             child: TextFormField(
      //               maxLength: 15,
      //               controller: title,
      //               textDirection: TextDirection.rtl,
      //               decoration: InputDecoration(
      //                // border: OutlineInputBorder(),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide:const BorderSide(
      //                     color: Color(0xFF48907E),
      //                     width: 2.0,
      //                   ),
      //                   borderRadius: BorderRadius.circular(15),
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide:const BorderSide(
      //                     color: Color(0xFF48907E),
      //                     width: 2.0,
      //                   ),
      //                   borderRadius: BorderRadius.circular(15),
      //                 ),
      //                 label:const Text("Note",style: TextStyle(color: Colors.white),),
      //                 hintText: "Note",
      //               ),
      //               validator: (value) {
      //                 if (value!.isEmpty) {
      //                   return 'Description is required';
      //                 } else {
      //                   return null;
      //                 }
      //               },
      //             ),
      //           ),
      //           const SizedBox(height: 10),
      //           TextFormField(
      //             maxLength: 15,
      //             controller: color,
      //             textDirection: TextDirection.rtl,
      //             decoration: InputDecoration(
      //               //border: OutlineInputBorder(),
      //               focusedBorder: OutlineInputBorder(
      //                 borderSide:const BorderSide(
      //                   color: Color(0xFF48907E),
      //                   width: 2.0,
      //                 ),
      //                 borderRadius: BorderRadius.circular(15),
      //               ),
      //               enabledBorder: OutlineInputBorder(
      //                 borderSide:const BorderSide(
      //                   color: Color(0xFF48907E),
      //                   width: 2.0,
      //                 ),
      //                 borderRadius: BorderRadius.circular(15),
      //               ),
      //               label:const Text("Color Of Note",style: TextStyle(color: Colors.white),),
      //               hintText: "Color",
      //             ),
      //             validator: (value) {
      //               if (value!.isEmpty) {
      //                 return "Enter content";
      //               }
      //               return null;
      //             },
      //           ),
      //           const SizedBox(height: 30),
      //           MaterialButton(
      //             textColor: Colors.white,
      //             color: Colors.blue,
      //             onPressed: () async {
      //               // int response = await sqflite.insertData('''
      //               //  INSERT INTO tableNotes ('title','note','color')
      //               //  VALUES ("${title.text}","${note.text}","${color.text}")
      //               //  ''');
      //               if (!formState.currentState!.validate()) {
      //                 return;
      //               }
      //               int response = await sqflite.insert("tableNotes", {
      //                 'title': title.text,
      //                 'note': note.text,
      //                 'color': color.text
      //               });
      //               if (response >= 1) {
      //                 Navigator.of(context).pushAndRemoveUntil(
      //                     MaterialPageRoute(builder: (ctx) => HomeTwo()),
      //                     (route) => false);
      //               }
      //               print("response ============== \n$response");
      //             },
      //             child: const Text("Add Note"),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
