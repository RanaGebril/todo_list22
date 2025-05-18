class TaskModel {
  String id;
  String title;
  String subTitle;
  int date;
  bool isDone;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.date,
    this.isDone = false,
    required this.userId
  });

  // firebase understand map , app understand object

  TaskModel.fromJson(Map<String, dynamic> json)
    : this(
        title: json["title"],
        subTitle: json["subTitle"],
        date: json["date"],
        id: json["id"],
        isDone: json["isDone"],
      userId: json["userId"]

      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "id": id,
      "isDone": isDone,
      "userId":userId
    };
  }
}
