import 'package:audiohub/models/address_model.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:flutter/material.dart';

bool addressValidation({required AddressModel addressModel, required BuildContext context}) {
  if (addressModel.name!.isEmpty) {
    alertshower(message: 'Name cannot be empty', context: context);
    return false;
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(addressModel.name!)) {
    alertshower(message: 'Name can only contain alphabets', context: context);
    return false;
  } else if (addressModel.houseNo!.isEmpty) {
    alertshower(message: 'Flat, House no., Building, Company cannot be empty', context: context);
    return false;
  } else if (addressModel.city!.isEmpty) {
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(addressModel.city!)) {
      alertshower(message: 'City can only contain alphabets', context: context);
      return false;
    }
    alertshower(message: 'City cannot be empty', context: context);
    return false;
  } else if (addressModel.state!.isEmpty) {
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(addressModel.state!)) {
      alertshower(message: 'State can only contain alphabets', context: context);
      return false;
    }
    alertshower(message: 'State cannot be empty', context: context);
    return false;
  } else if (addressModel.district!.isEmpty) {
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(addressModel.district!)) {
      alertshower(message: 'District can only contain alphabets', context: context);
      return false;
    }
    alertshower(message: 'District cannot be empty', context: context);
    return false;
  } else if (addressModel.pincode!.isEmpty) {
    if (RegExp(r'^[a-zA-Z]+$').hasMatch(addressModel.pincode!)) {
      alertshower(message: 'Pincode can only contain numbers', context: context);
      return false;
    }
    alertshower(message: 'Pincode cannot be empty', context: context);
    return false;
  } else if (addressModel.mobile!.isEmpty) {
    if (RegExp(r'^[a-zA-Z]+$').hasMatch(addressModel.mobile!)) {
      alertshower(message: 'Mobile number can only contain numbers', context: context);
      return false;
    }
    alertshower(message: 'Mobile number cannot be empty', context: context);
    return false;
  } else if (addressModel.landmark!.isEmpty) {
    alertshower(message: 'Landmark cannot be empty', context: context);
  }
  return true;
}
