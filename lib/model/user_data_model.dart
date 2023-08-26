class UserDataModel{
  int? idNumb;
  String? name;
  int? phoneNumber;
  String? DatabaseId;
  UserDataModel({this.name, this.idNumb, this.phoneNumber,this.DatabaseId});
  factory UserDataModel.fromJson( Map<String, dynamic> json, String id) {
    return UserDataModel(
      idNumb: json['idNumb'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      DatabaseId: id

    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idNumb'] = this.idNumb;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}