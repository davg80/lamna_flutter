import 'package:lamna/models/city.dart';

class Cities {
  List<City> cities = [];

  Cities(List<dynamic> data) {
    Iterable databaseData = data;
    for (var city in databaseData) {
      final City newCity = City(city);
      cities.add(newCity);
    }
    print("CITIES CLASS $cities");
  }

  get length => cities.length;

  @override
  String toString() {
    return cities.toString();
  }
}
