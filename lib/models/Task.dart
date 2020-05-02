class Task {
  String title;
  bool isDone;
  String category;
  int id;

  Task({this.title, this.isDone = false, this.category = "منوع"});

  void toggleDone() {
    isDone = !isDone;
  }

  Task.map(dynamic obj) {
    this.title = obj['title'];
    this.category = obj['category'];
    this.id = obj['id'];
  }
  Task.fromMap(Map<String, dynamic> map) {
    this.title = map["title"];
    this.category = map["category"];
    this.id = map["id"];
  }

  String get getTitle => title;
  String get getCategory => category;
  int get getId => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = title;
    map["category"] = category;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
