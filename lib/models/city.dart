class City {
  late int id;
  late String name;
  late String title;
  late String createdAt;
  late double visitingTime;
  late String text;
  late String label;
  late String picture;
  late bool enable;

  City(city) {
    id = city['city_id'];
    name = city['city_name'];
    title = city['city_title'];
    createdAt = city['city_created_at'];
    visitingTime = city['city_visiting_time'];
    text = city['city_text'];
    label = city['city_label'];
    picture = city['city_picture'];
    enable = city['city_enable'];
  }
}
