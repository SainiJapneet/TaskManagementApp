class TaskDataModel {
  String taskTitle = "";
  String taskDetail = "";
  String taskDate = "";
  String taskTime = "";
  String? taskPriority = "";
  String? taskType = "";
  TaskDataModel(
      {required String title,
      required String detail,
      required String date,
      required String time,
      required String? priority,
      required String? type}) {
    taskTitle = title;
    taskDetail = detail;
    taskDate = date;
    taskTime = time;
    taskPriority = priority;
    taskType = type;
  }

  Map<String, dynamic> toJson() => {
        'Task Title': taskTitle,
        'Task': taskDetail,
        'Deadline Date': taskDate,
        'Deadline Time': taskTime,
        'Task Priority': taskPriority,
        'Task Type': taskType
      };

  static TaskDataModel fromJSON(Map<String, dynamic> json) => TaskDataModel(
      title: json['Task Title'],
      detail: json['Task'],
      date: json['Deadline Date'],
      time: json['Deadline Time'],
      priority: json['Task Priority'],
      type: json['Task Type']);
}
