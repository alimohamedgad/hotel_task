part of 'hotel_cubit.dart';


@immutable

sealed class HotelState {}


final class HotelInitial extends HotelState {}


final class GetHotelSuccess extends HotelState {}


final class GetHotelLoading extends HotelState {}


final class GetHotelError extends HotelState {}


final class UpdateSliderValue extends HotelState {}


final class UpdateStartIndex extends HotelState {}

