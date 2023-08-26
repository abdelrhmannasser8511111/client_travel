class TripBookingStatus{
  String UserId;
  String TripId;
  String status;
  String? TripBookingStatusid;
  TripBookingStatus({required this.status,required this.TripId,required this.UserId, this.TripBookingStatusid });
  factory TripBookingStatus.fromJson(Map<String, dynamic> json,String id) {
    return TripBookingStatus(
        TripBookingStatusid: id,
        UserId: json['userId'],
        TripId: json['tripId'],
        status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['userId'] = this.UserId;
    data['tripId'] = this.TripId;
    data['status'] = this.status;
    return data;
  }

  }