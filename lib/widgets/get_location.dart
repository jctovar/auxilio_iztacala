import 'package:flutter/material.dart';
import 'package:alerta/services/location_service.dart';
import 'package:fl_location/fl_location.dart';
import 'package:alerta/utils/logger.dart';
import 'package:alerta/globals/environment.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  String text = '';

  Future<bool> _checkAndRequestPermission({bool? background}) async {
    if (!await FlLocation.isLocationServicesEnabled) {
      // Location services are disabled.
      return false;
    }

    var locationPermission = await FlLocation.checkLocationPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      // Cannot request runtime permission because location permission is denied forever.
      return false;
    } else if (locationPermission == LocationPermission.denied) {
      // Ask the user for location permission.
      locationPermission = await FlLocation.requestLocationPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) return false;
    }

    // Location permission must always be allowed (LocationPermission.always)
    // to collect location data in the background.
    if (background == true &&
        locationPermission == LocationPermission.whileInUse) return false;

    // Location services has been enabled and permission have been granted.
    return true;
  }

  Future<void> _getLocation() async {
    if (await _checkAndRequestPermission()) {
      const timeLimit = Duration(seconds: 10);
      await FlLocation.getLocation(timeLimit: timeLimit).then((location) {
        setState(() {
          text = '${location.latitude}, ${location.longitude}';
        });

        _sendLocation('088400039', location.toJson());

        Logs.p.i('location: ${location.toJson().toString()}');
      }).onError((error, stackTrace) {
        Logs.p.e('error: ${error.toString()}');
      });
    }
  }

  Future _sendLocation(String id, var data) async {
    Logs.p.i(data);

    data['deviceId'] = id;

    var result = await LocationService.addLocation(data);
    if (result == 201) {
      Environment.showSnackbar(context, 'Se envio la ubicación correctamente.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Ubicación:',
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        IconButton(
          icon: const Icon(Icons.crisis_alert),
          iconSize: 60,
          color: Colors.red,
          onPressed: () {
            _getLocation();
          },
        ),
      ],
    );
  }
}
