// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:hotel_task/features/data/data_source/remote_data_source.dart';
// import 'package:hotel_task/features/data/model/hotel_model.dart';

import '../../../core/api_services.dart';
import '../model/hotel_model.dart';

class HotelRepository {
  ApiService apiService;
  HotelRepository(
    this.apiService,
  );

  Future<List<HotelModel>> getHotel() async {
    final response = await apiService.get(endPoint: "hotels");
    return response.map((e) => HotelModel.fromMap(e)).toList();
  }
}
