class ChatResponseModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  ChatResponseModel({this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: json['choices'] != null
          ? (json['choices'] as List).map((i) => Choices.fromJson(i)).toList()
          : null,
    );
  }
}

class Choices {
  int? index;
  Message? message;
  String? finishReason;

  Choices({this.index, this.message,this.finishReason});

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      index: json['index'],
      message: json['message'] != null ? Message.fromJson(json['message']) : null,
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['finish_reason'] = finishReason;
    return data;
  }

}

class Message {
  String? role;
  String? content;
  String? sender;

  Message({this.role, this.content,this.sender});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }


}
