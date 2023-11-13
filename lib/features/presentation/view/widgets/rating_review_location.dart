// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_task/features/data/model/hotel_model.dart';

import '../../../../core/styles/app_styles.dart';

class RatingReviewLocation extends StatelessWidget {
  final HotelModel hotelModel;
  const RatingReviewLocation({
    super.key,
    required this.hotelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              hotelModel.reviewScore.toString(),
              style: Styles.style14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(hotelModel.review),
          const SizedBox(width: 8),
          const Icon(
            Icons.place,
            size: 15,
          ),
          const SizedBox(width: 8),
          Text(hotelModel.address),
        ],
      ),
    );
  }
}
