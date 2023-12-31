import 'package:flutter/material.dart';
import 'package:restaurant_app_1/config/app_route.dart';
import 'package:restaurant_app_1/config/theme.dart';
import 'package:restaurant_app_1/data/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        MyRoutes.detailRoute,
        arguments: restaurant,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: orangeColor.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              restaurant.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          restaurant.city,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: yellowColor,
                    ),
                    const SizedBox(width: 4),
                    Text(restaurant.rating.toString()),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
