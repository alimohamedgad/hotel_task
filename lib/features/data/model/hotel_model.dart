class HotelModel {
  final String name;
  final int starts;
  final num price;
  final num reviewScore;
  final String review;
  final String image;
  final String address;
  HotelModel({
    required this.name,
    required this.starts,
    required this.price,
    required this.reviewScore,
    required this.review,
    required this.image,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'starts': starts,
      'price': price,
      'reviewScore': reviewScore,
      'review': review,
      'image': image,
      'address': address,
    };
  }

  factory HotelModel.fromMap(dynamic map) {
    return HotelModel(
      name: map['name'] as String,
      starts: map['starts'] as int,
      price: map['price'] as dynamic,
      reviewScore: map['review_score'] as dynamic,
      review: map['review'] as String,
      image: map['image'] as String,
      address: map['address'] as String,
    );
  }
}
