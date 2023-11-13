import 'package:flutter/material.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../data/model/hotel_model.dart';
import 'hotel_name_with_starts.dart';
import 'price_with_viewdeal.dart';
import 'rating_review_location.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelItem({
    super.key,
    required this.hotelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(
              0.4,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.network(
              hotelModel.image,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,

              // width: double.infinity,
            ),
          ),
          const SizedBox(height: 4),
          HotelNameWithStarts(hotelModel: hotelModel),
          RatingReviewLocation(hotelModel: hotelModel),
          PriceWithViewDeal(hotelModel: hotelModel),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'More prices',
                style: Styles.style14.copyWith(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
