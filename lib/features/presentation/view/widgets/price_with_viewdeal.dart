// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_task/core/app_colors.dart';
import 'package:hotel_task/features/data/model/hotel_model.dart';

import '../../../../core/styles/app_styles.dart';

class PriceWithViewDeal extends StatelessWidget {
  final HotelModel hotelModel;
  const PriceWithViewDeal({
    super.key,
    required this.hotelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Our lowest price'),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                '\$${hotelModel.price}',
                style: Styles.style20.copyWith(
                    color: AppColor.green, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                'View Deal',
                style: Styles.style18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
          const Text('Renaissance')
        ],
      ),
    );
  }
}
