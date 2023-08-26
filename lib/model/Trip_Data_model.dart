class TripDataModel{
  String? id;
  String? name;
  int? price;
  String? summary;
  String? image;
  TripDataModel({this.name,
    //this.id,
    this.price, this.summary,this.image,  this.id});
  factory TripDataModel.fromJson(Map<String, dynamic> json,String id) {
    return TripDataModel(
      id: id,
      name: json['name'],
      price: json['price'],
      summary: json['summary'],
      image:json["image"]

    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   // data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['summary'] = this.summary;
    data["image"]=this.image;
    return data;
  }
}