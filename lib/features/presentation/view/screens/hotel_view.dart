// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_task/features/data/model/hotel_model.dart';

import '../widgets/bottom_nav_google_map.dart';
import 'hotel_body.dart';

class HotelView extends StatelessWidget {
  final List<HotelModel>? filterList;
  const HotelView({
    super.key,
    this.filterList,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavGoogleMap(),
        body: HotelBody(filterHotelList: filterList ?? []),
      ),
    );
  }
}
