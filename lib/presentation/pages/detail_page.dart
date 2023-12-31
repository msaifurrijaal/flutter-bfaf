import 'package:flutter/material.dart';
import 'package:restaurant_app_1/config/theme.dart';
import 'package:restaurant_app_1/data/model/menu.dart';
import 'package:restaurant_app_1/data/model/restaurant.dart';

class DetailPage extends StatelessWidget {
  final Restaurant restaurant;
  final String foodType = 'food';
  final String drinkType = 'drink';

  const DetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            restaurant.pictureId,
                            height: screenHeight * 0.5,
                            width: screenWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            //padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: whiteColor.withOpacity(0.6),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: whiteColor.withOpacity(0.6),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: screenWidth,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              restaurant.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: yellowColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  restaurant.rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          restaurant.city,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: greyColor,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Description :',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          restaurant.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Foods :',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        _gridViewMenus(screenWidth, restaurant.menus, foodType),
                        const SizedBox(height: 20),
                        Text(
                          'Drinks :',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        _gridViewMenus(
                            screenWidth, restaurant.menus, drinkType),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView _gridViewMenus(double screenWidth, Menus menu, String type) {
    return GridView.builder(
      itemCount: type == foodType ? menu.foods.length : menu.drinks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth <= 500 ? 2 : (screenWidth <= 1200 ? 4 : 6),
        mainAxisSpacing: 12,
        crossAxisSpacing: 6,
        childAspectRatio: 8 / 2,
      ),
      itemBuilder: (context, index) {
        if (type == foodType) {
          var food = menu.foods[index];
          return _widgetAtribut(
            context,
            const Icon(Icons.food_bank),
            food.name,
          );
        } else {
          var drink = menu.drinks[index];
          return _widgetAtribut(
            context,
            const Icon(Icons.food_bank),
            drink.name,
          );
        }
      },
    );
  }

  ElevatedButton _widgetAtribut(BuildContext context, Icon icon, String text) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        elevation: const MaterialStatePropertyAll(0),
        foregroundColor: const MaterialStatePropertyAll(orangeColor),
        backgroundColor: const MaterialStatePropertyAll(softOrangeColor),
      ),
      onPressed: () {},
      icon: icon,
      label: Text(
        text,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: orangeColor,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
