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


  num numberOfRating = 0;


  reset() {

    numberOfRating = 0;


    sliderValue = 20.0;


    numberOfStar = 1;


    currentIndex = 0;


    emit(ResetAllValue());

  }


  void updateSliderValue(double value) {

    sliderValue = value;


    emit(UpdateStartIndexState());

  }


  getHotel() async {

    emit(GetHotelLoadingState());


    hotelDataSource.getHotel().then((hotelList) {

      hotels = hotelList;


      emit(GetHotelSuccessState());

    }).catchError((e) {

      emit(UpdateStartIndexState());


      log(e.toString());

    });

  }


  int numberOfStar = 0;


  int currentIndex = 0;


  updateCurrentIndex(int index) {

    currentIndex = index;


    emit(UpdateCurrentIndexOfSortState());

  }


  bool ascendingHotels = true;


  updateSort() {

    ascendingHotels = !ascendingHotels;


    emit(UpdateSortHotelState());

  }


  updateNumberOfStar(int newIndex) {

    numberOfStar = newIndex;


    emit(UpdateStartIndexState());

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


  void sortHotelsByPrice(List<HotelModel> hotels) {

    List<HotelModel> sortedHotels = List.from(hotels);


    sortedHotels.sort((a, b) => a.price.compareTo(b.price));

  }

}

