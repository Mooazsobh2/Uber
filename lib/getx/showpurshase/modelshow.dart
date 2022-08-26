class ShowPurchase {
  ShowPurchase({
    required this.data2,
  });
  late final List<Data2> data2;

  ShowPurchase.fromJson(Map<String, dynamic> json){
    data2 = List.from(json['data2']).map((e)=>Data2.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data2'] = data2.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data2 {
  Data2({
    required this.id,
    required this.customerId,
    required this.imgUrl,
    required this.carType,
    required this.modelName,
    required this.manufactorYear,
    required this.technicalCondition,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int customerId;
  late final String imgUrl;
  late final String carType;
  late final String modelName;
  late final String manufactorYear;
  late final String technicalCondition;
  late final String price;
  late final String createdAt;
  late final String updatedAt;

  Data2.fromJson(Map<String, dynamic> json){
    id = json['id'];
    customerId = json['customer_id'];
    imgUrl = json['img_url'];
    carType = json['car_type'];
    modelName = json['model_name'];
    manufactorYear = json['manufactor_year'];
    technicalCondition = json['technical_condition'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['customer_id'] = customerId;
    _data['img_url'] = imgUrl;
    _data['car_type'] = carType;
    _data['model_name'] = modelName;
    _data['manufactor_year'] = manufactorYear;
    _data['technical_condition'] = technicalCondition;
    _data['price'] = price;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}