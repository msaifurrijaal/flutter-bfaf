import 'package:flutter/material.dart';
import 'package:restaurant_app_1/config/theme.dart';
import 'package:restaurant_app_1/data/model/restaurant.dart';
import 'package:restaurant_app_1/data/model/restaurant_data.dart';
import 'package:restaurant_app_1/presentation/widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant> restaurants = [];
  RestaurantData restaurantData = RestaurantData(restaurants: []);
  String data = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    data = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');
    setState(() {
      restaurantData = restaurantDataFromJson(data);
      restaurants = restaurantData.restaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Eats,\nYour Go-To Restaurant Guide!',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: orangeColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SearchBar(
                  side: const MaterialStatePropertyAll(
                    BorderSide(color: lightOrangeColor, width: 2),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(bgEditTextColor),
                  onChanged: (value) {
                    setState(() {
                      restaurants = restaurantData.restaurants
                          .where((restaurant) =>
                              restaurant.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              restaurant.city
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  textStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w100,
                            color: greyColor,
                          )),
                  hintText: "Search..",
                  hintStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w100,
                            color: greyColor,
                          )),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(45),
                      ), // Mengatur border radius menjadi 10
                    ),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.search,
                      color: blackColor,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Top Restaurant',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                restaurants.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        height: 150,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.not_interested_sharp,
                              size: 60,
                              color: greyColor,
                            ),
                            SizedBox(height: 12),
                            Text('Data Kosong'),
                          ],
                        ),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth <= 500) {
                            return _gridviewWidget(context, 2);
                          } else if (constraints.maxWidth <= 1200) {
                            return _gridviewWidget(context, 4);
                          } else {
                            return _gridviewWidget(context, 6);
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView _gridviewWidget(BuildContext context, int gridcount) {
    return GridView.builder(
      itemCount: restaurants.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridcount,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        final Restaurant restaurant = restaurants[index];
        return RestaurantCard(restaurant: restaurant);
      },
    );
  }
}
