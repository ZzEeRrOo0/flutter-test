import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task {
  Task({
    this.id,
    this.title = "",
    this.description = "",
    this.completedAt
  }){
    this.id = null;
    this.completedAt = null;
  }

  late String? id;
  late String title;
  late String description;
  @JsonKey(name: 'completed_at')
  late DateTime? completedAt;

  bool get isNew {
    return id == null;
  }

  bool get isCompleted {
    return completedAt != null;
  }

  void toggleComplete() {
    if (isCompleted) {
      completedAt = null;
    } else {
      completedAt = DateTime.now();
    }
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
