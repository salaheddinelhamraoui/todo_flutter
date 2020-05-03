class TaskTile2 {
  String title;

  String category;
  int id;
  String f;
  TaskTile2({this.title, this.category = "منوع"});

  TaskTile2.map(dynamic obj) {
    this.title = obj['title'];
    this.category = obj['category'];
    this.id = obj['id'];
  }
  TaskTile2.fromMap(Map<String, dynamic> map) {
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
