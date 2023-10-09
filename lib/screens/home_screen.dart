import 'package:flutter/material.dart';
import 'package:notes/color.dart';
import 'package:notes/model/note.dart';
import 'package:notes/screens/add_note_screen.dart';

import 'package:notes/screens/edit_note_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> myNote = [
    Note("title", "content","https://st3.depositphotos.com/3433891/31776/i/450/depositphotos_317769338-stock-photo-young-hispanic-cool-woman-blue.jpg"),
  ];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:const Text("Your Notes", style: TextStyle(fontSize: 33,
              color: Colors.blue, fontWeight: FontWeight.w900),),
        actions: [
          IconButton(
            onPressed: (){},
        icon:const Icon(Icons.list,
        color: Colors.blue,
          size: 30,
        ))
        ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () =>
              openAddNewNote(),

          child:const Icon(Icons.add),

        ),
        body: ListView.builder(
            itemCount: myNote.length,
            itemBuilder: (context, index) {
              return buildItem(index);
            }
        )

    );
  }

  Widget buildItem(int index) {
    return Container(
      margin:const EdgeInsets.all(10),
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                myNote[index].saveTitle == 'null' ?
                const SizedBox():
            Text(
              myNote[index].saveTitle,
              style:const TextStyle(
                  color:
                  Colors.red,
                  fontWeight: FontWeight.w700,
                ),
                ),
          ),
         myNote[index].image.isEmpty ?
         const SizedBox() :
          Image.network(
            myNote[index].image,
            width:double.infinity,
            height: 150,
            fit: BoxFit.fill,),

          Padding(
            padding: const EdgeInsets.all(8),
            child:
            Text(
              myNote[index].title
              , style:const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
            Text(
              myNote[index].content
              , style:const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape:const StadiumBorder(),
                    ),
                    onPressed: () {
                      myNote.removeAt(index);
                      setState(() {

                      });
                    },
                    icon:const Icon(Icons.delete),
                    label:const Text("Delete")),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape:const StadiumBorder(),
                    ),
                    onPressed: () {
                      editNote(index);
                    },
                    icon:const Icon(Icons.edit),
                    label:const Text("Edit")),
              ),
            ],)

        ],),
    );
  }

  void openAddNewNote() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) =>const AddNoteScreen(),
    )
    ).then((value) => addNote(value),);
  }

  addNote(Note value) {
    myNote.add(value);
    setState(() {});
  }

  void editNote(int index) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) =>
          EditNoteScreen(note: myNote[index]),
    ),

    ).then((value) => ubdateCurrentNote(index, value));
  }

  ubdateCurrentNote(int index, value) {
    myNote[index] = value;
    setState(() {});
  }

  void isImportant() {
    if (isChecked == true) {
      Visibility(
        visible: isChecked,
        child:const Text(
          'This is an important note',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    else {
      return;
    }
  }
}