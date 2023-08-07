import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../controller/global_controller.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
