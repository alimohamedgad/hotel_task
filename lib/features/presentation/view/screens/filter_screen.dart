// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_task/core/styles/app_styles.dart';
import 'package:hotel_task/features/presentation/hotel_cubit/hotel_cubit.dart';
import '../widgets/fitler_widgets/filter_button_result.dart';
import '../widgets/fitler_widgets/price_per_night.dart';
import '../widgets/fitler_widgets/rating_list.dart';
import '../widgets/fitler_widgets/start_hotel_class.dart';

class FilterModalBottomSheet extends StatefulWidget {
  const FilterModalBottomSheet({super.key});

  @override
  State<FilterModalBottomSheet> createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        final hotelCubit = context.read<HotelCubit>();
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      hotelCubit.reset();
                    },
                    child: Text(
                      'Reset',
                      style: Styles.style16.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey.withOpacity(0.8),
                          color: Colors.grey.withOpacity(0.8)),
                    ),
                  ),
                  Text('Filter ', style: Styles.style20),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PricePerNight(),
                  const SizedBox(height: 10),
                  Slider(
                    value: hotelCubit.sliderValue,
                    min: 20.0,
                    max: hotelCubit.maxValue,
                    onChanged: (value) {
                      hotelCubit.updateSliderValue(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Text('\$${hotelCubit.sliderValue.toInt()}'),
                        const Spacer(),
                        Text('\$${hotelCubit.maxValue.toInt()}'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating'.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const RatingContainer(),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hotel Class',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  StarRatingList()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('distance from'.toUpperCase()),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Location'),
                  Spacer(),
                  Text('City center'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            FilterButtonResult(hotelCubit: hotelCubit)
          ],
        );
      },
    );
  }
}
