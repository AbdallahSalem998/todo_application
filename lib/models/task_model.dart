class TaskModel {
  String id;
  String title;
  String description;
  bool status;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.status,
      required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          status: json['status'],
          date: json['date'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "status": status,
      "date": date,
    };
  }
}
