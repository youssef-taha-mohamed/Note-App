import 'package:flutter/material.dart';
import 'package:notes/model/sqflite.dart';
import 'package:notes/screens/edit.dart';

import '../color.dart';

class HomeTwo extends StatefulWidget {
  HomeTwo({super.key});

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  List notes = [];
  Sqflite sqflite = Sqflite();
  bool isLoading = true;

  Future readData() async {
    List<Map> response = await sqflite.read("tableNotes");
    notes.addAll(response);
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        title: const Text(
          "My Notes",
          style: TextStyle(
              fontSize: 33, color: Colors.blue, fontWeight: FontWeight.w900),
        ),
      ),
      body: isLoading == true
          ? const Center(
              child: Text("Loading...."),
            )
          : ListView.builder(
              itemCount: notes.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, item) {
                return buildItem(item);
                //   Card(
                //   child: ListTile(
                //       title: Text("${notes[item]['title']}"),
                //       subtitle: Text("${notes[item]['note']}"),
                //       trailing: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           IconButton(
                //             onPressed: () async {
                //               // int response = await sqflite.deleteData(
                //               //     "DELETE FROM tableNotes WHERE id=${notes[item]['id']}");
                //               int response = await sqflite.delete(
                //                   "tableNotes", 'id=${notes[item]['id']}');
                //               if (response > 0) {
                //                 setState(() {});
                //                 notes.removeWhere((element) =>
                //                     element['id'] == notes[item]['id']);
                //               }
                //             },
                //             icon: const Icon(
                //               Icons.delete,
                //               color: Colors.red,
                //             ),
                //           ),
                //           IconButton(
                //             onPressed: () async {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: (ctx) => EditNotes(
                //                         color: notes[item]['color'],
                //                         title: notes[item]['title'],
                //                         note: notes[item]['note'],
                //                         id: notes[item]['id'],
                //                       )));
                //             },
                //             icon: const Icon(
                //               Icons.edit,
                //               color: Colors.blue,
                //             ),
                //           ),
                //         ],
                //       )),
                // );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addNotes");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItem(int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "${notes[index]['title']}",
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "${notes[index]['note']}",
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "${notes[index]['color']}",
              style: const TextStyle(color:Colors.white,fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      int response = await sqflite.delete(
                          "tableNotes", 'id=${notes[index]['id']}');
                      if (response > 0) {
                        setState(() {});
                        notes.removeWhere(
                            (element) => element['id'] == notes[index]['id']);
                      }
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete")),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => EditNotes(
                                color: notes[index]['color'],
                                title: notes[index]['title'],
                                note: notes[index]['note'],
                                id: notes[index]['id'],
                              )));
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
