class City {
  late int id;
  late String name;
  late String subtitle;
  late String createdAt;
  late String text;
  late String label;
  late String picture;
  late List<String> decoverySite;
  late bool enable;

  City({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.createdAt,
    required this.text,
    required this.label,
    required this.picture,
    required this.decoverySite,
    required this.enable,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subtitle = json['subtitle'];
    createdAt = json['createdAt'];
    text = json['text'];
    label = json['label'];
    picture = json['picture'];
    decoverySite = List<String>.from(json["decoverySite"].map((x) => x));
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['subtitle'] = subtitle;
    data['createdAt'] = createdAt;
    data['text'] = text;
    data['label'] = label;
    data['picture'] = picture;
    data['decoverySite'] = List<dynamic>.from(decoverySite.map((x) => x));
    data['enable'] = enable;
    return data;
  }

  @override
  String toString() {
    return '{"id":$id,"name":$name,"subtitle":$subtitle,"createdAt":$createdAt,"text":$text,"label":$label,"picture":$picture, "decoverySite":${decoverySite.toString()},"enable":$enable}';
  }
}
