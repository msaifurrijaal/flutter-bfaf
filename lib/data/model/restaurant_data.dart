import 'dart:convert';

import 'package:restaurant_app_1/data/model/restaurant.dart';

RestaurantData restaurantDataFromJson(String str) =>
    RestaurantData.fromJson(json.decode(str));

String restaurantDataToJson(RestaurantData data) => json.encode(data.toJson());

class RestaurantData {
  List<Restaurant> restaurants;

  RestaurantData({
    required this.restaurants,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
