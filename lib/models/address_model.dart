class AddressModel {
  String? address;
  String? city;
  String? district;
  String? state;
  String? pincode;
  String? landmark;

  Map<String, dynamic> tomap() {
    return {
      'address': address,
      'city': city,
      'district': district,
      'state': state,
      'pincode': pincode,
      'landmark': landmark
    };
  }
}
