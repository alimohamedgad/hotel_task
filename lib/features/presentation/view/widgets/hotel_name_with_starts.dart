// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_task/features/data/model/hotel_model.dart';

import '../../../../core/styles/app_styles.dart';

class HotelNameWithStarts extends StatelessWidget {
  final HotelModel hotelModel;
  const HotelNameWithStarts({
    super.key,
    required this.hotelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ...List.generate(
                hotelModel.starts,
                (index) => Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Hotel',
                style: Styles.style14.copyWith(
                  color: Colors.black.withOpacity(0.7),
                ),
              )
            ],
          ),
          Text(
            hotelModel.name,
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
