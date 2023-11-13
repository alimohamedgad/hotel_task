part of 'hotel_cubit.dart';


@immutable

sealed class HotelState {}


final class HotelInitial extends HotelState {}


final class GetHotelSuccessState extends HotelState {}


final class GetHotelLoadingState extends HotelState {}


final class GetHotelErrorState extends HotelState {}


final class UpdateSliderValueState extends HotelState {}


final class UpdateStartIndexState extends HotelState {}


final class UpdateCurrentIndexOfSortState extends HotelState {}


final class UpdateSortHotelState extends HotelState {}


final class ResetAllValue extends HotelState {}

