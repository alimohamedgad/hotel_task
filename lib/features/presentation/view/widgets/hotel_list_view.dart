// // ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../hotel_cubit/hotel_cubit.dart';
// import 'hotel_item.dart';

// class HotelListView extends StatelessWidget {
//   // final List<HotelModel> filterList;
//   const HotelListView({
//     Key? key,
//   }) : super(key: key);

//   // @override
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HotelCubit, HotelState>(
//       builder: (context, state) {
//         final hotelCubit = context.read<HotelCubit>();
//         // final filters = hotelCubit.getFilterListData(
//         //     hotelCubit.sliderValue.toInt(), hotelCubit.numberOfRating);
//         return Expanded(
//           child: ListView.builder(
//             itemCount:
//                 filters.isEmpty ? hotelCubit.hotels.length : filters.length,
//             itemBuilder: (context, index) {
//               final hotelModel = hotelCubit.hotels[index];
//               return Stack(
//                 children: [
//                   Column(
//                     children: [
//                       HotelItem(hotelModel: hotelModel),
//                     ],
//                   ),
//                   Positioned(
//                     right: 40,
//                     top: 40,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             spreadRadius: 10,
//                             blurRadius: 1,
//                             color: Colors.black.withOpacity(0.2),
//                           ),
//                         ],
//                       ),
//                       child: const Icon(
//                         Icons.favorite_outline,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
