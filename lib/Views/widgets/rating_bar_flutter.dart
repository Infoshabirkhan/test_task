import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class RatingBarFlutter extends StatelessWidget {
  final double value;
  const RatingBarFlutter({super.key,required this.value});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      size: 18,
      filledIcon: Icons.star,
      emptyIcon: Icons.star_border,
      onRatingChanged: (value) => debugPrint('$value'),
      initialRating: value,
      maxRating: 5,
    );
  }
}
