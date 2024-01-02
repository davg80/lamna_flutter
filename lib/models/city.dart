class City {
  int? id;
  String? name;
  String? title;
  String? createdAt;
  double? visitingTime;
  String? text;
  String? label;
  String? picture;
  bool? enable;

  City(
      {this.id,
      this.name,
      this.title,
      this.createdAt,
      this.visitingTime,
      this.text,
      this.label,
      this.picture,
      this.enable});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['createdAt'];
    visitingTime = json['visitingTime'];
    text = json['text'];
    label = json['label'];
    picture = json['picture'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['createdAt'] = createdAt;
    data['visitingTime'] = visitingTime;
    data['text'] = text;
    data['label'] = label;
    data['picture'] = picture;
    data['enable'] = enable;
    return data;
  }

  @override
  String toString() {
    return '{"id":$id,"name":$name,"title":$title,"createdAt":$createdAt,"visitingTime":$visitingTime,"text":$text,"label":$label,"picture":$picture,"enable":$enable}';
  }
}
