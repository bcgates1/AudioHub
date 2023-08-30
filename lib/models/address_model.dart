class AddressModel {
  String? name;
  String? houseNo;
  String? city;
  String? district;
  String? state;
  String? pincode;
  String? mobile;
  String? landmark;

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'houseNo': houseNo,
      'city': city,
      'district': district,
      'state': state,
      'pincode': pincode,
      'mobile': mobile,
      'landmark': landmark
    };
  }
}
