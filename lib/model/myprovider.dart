import 'package:flutter/cupertino.dart';
import 'package:notes/model/note.dart';

import '../db/note_reprosety.dart';


class MyProvider extends ChangeNotifier{
  late Note premiumModel = Note(title: "", content: "");
  List<Note>? listText= [];
  late NoteRepository note = NoteRepository();

  void stateFun() {
    retreivedata();
    //notifyListeners();
  }
  void retreivedata() async {
    listText = await note.retrieve();
    notifyListeners();
  }
  void del(int id) async {
    listText = await note.deleted(id);
    notifyListeners();
  }

  void getNoteById(int id) async{
    List<Note> noteList = await note.retrieveById(id);
    premiumModel= noteList[0];
    notifyListeners();
  }
}