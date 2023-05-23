class Item {
  int? id;
  String? question;
  List<dynamic>? choices;

  Item({this.id, this.question, this.choices});
 
  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    choices = json['choices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["choices"] = choices;
    return data;
  }
}
