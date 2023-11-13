// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:developer';


import 'package:bloc/bloc.dart';


import 'package:hotel_task/features/data/model/hotel_model.dart';


import 'package:meta/meta.dart';


import 'package:hotel_task/features/data/repo/hotel_repository.dart';


part 'hotel_state.dart';


class HotelCubit extends Cubit<HotelState> {

  final HotelRepository hotelDataSource;


  HotelCubit(this.hotelDataSource) : super(HotelInitial());


  List<HotelModel> hotels = [];


  double minValue = 20.0;


  double maxValue = 540.0;


  double sliderValue = 20.0;


  num numberOfRating = 1;


  void updateSliderValue(double value) {

    sliderValue = value;


    emit(UpdateStartIndex());

  }


  getHotel() async {

    emit(GetHotelLoading());


    hotelDataSource.getHotel().then((hotelList) {

      hotels = hotelList;


      emit(GetHotelSuccess());

    }).catchError((e) {

      emit(UpdateStartIndex());


      log(e.toString());

    });

  }


  int numberOfStar = 1;


  updateNumberOfStar(int newIndex) {

    numberOfStar = newIndex;


    emit(UpdateStartIndex());

  }


  List<HotelModel> getFilterListData(

      int priceRange, num reviewScore, int numberOfStar) {

    return hotels

        .where(

          (hotel) =>

              hotel.price >= priceRange &&

              hotel.reviewScore >= reviewScore &&

              hotel.starts >= numberOfStar,

        )

        .toList();

  }

}

