import 'package:fidity/models/category.dart';

class UserLocation {
  String name;
  String address;
  double latitude;
  double longitude;
  Category category;
  double? distance;

  UserLocation(this.name, this.address, this.latitude,
      this.longitude, this.category, [this.distance]);

  static Set<UserLocation> getLocations() {
    return {
      UserLocation("UB Library", "Jl. Veteran, Ketawanggede",
          -7.9530095, 112.6134329, Category.disability),
      UserLocation("Jl. GOR Pertamina Universitas Brawijaya",
          "Penanggungan, Kec. Klojen",
          -7.953206, 112.615654, Category.disability),
      UserLocation("Jl. Pisang Kipas 3-5", "Jatimulyo, Kec. Lowokwaru,", -7.943820,
          112.618391,
          Category.guardian)
    };
  }
}