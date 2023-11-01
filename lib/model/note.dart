
//name TEXT,address TEXT, phone INTEGER,id_number INTEGER,item TEXT,total_item INTEGER, monthly INTEGER, period INTEGER
class Note {
  final int? id;
  final String title;
  final String content;


  Note({
    this.id,
    required this.title,
    required this.content,
  });

  Note.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        content = res["content"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,

    };
  }
}
