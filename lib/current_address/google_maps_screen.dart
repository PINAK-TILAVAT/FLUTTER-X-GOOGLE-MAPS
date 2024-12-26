import 'package:flutter/material.dart';
import 'package:flutter_maps/api_model/places_from_cordinates.dart';
import 'package:flutter_maps/api_services/api_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  double defaultlat = 22.308155;
  double defaultlng = 70.800705;
  PlaceFromCordinates placeFromCordinates = PlaceFromCordinates();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CURRENT ADDRESS"),
        centerTitle: true,
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(defaultlat, defaultlng), zoom: 14.4746),
          onCameraIdle: () {
            ApiServices()
                .placeFromCordinates(defaultlat, defaultlng)
                .then((onValue) {
              setState(() {
                defaultlat = onValue.results?[0].geometry?.location?.lat??0;
                defaultlng = onValue.results?[0].geometry?.location?.lng??0;
                placeFromCordinates = onValue;
              });
            });
          },
          onCameraMove: (CameraPosition position) {
            // if (kDebugMode) {
            //   print(
            //       "${position.target.latitude} || ${position.target.longitude} ");
            // }
            setState(() {
              defaultlat = position.target.latitude;
              defaultlng = position.target.longitude;
            });
          },
        ),
        Center(
          child: Icon(
            Icons.location_on_sharp,
            size: 30,
            color: Colors.red,
          ),
        ),
      ]),
      bottomSheet: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.location_on_sharp),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(placeFromCordinates.results?[0].formattedAddress ??
                    "LOADING.."))
          ],
        ),
      ),
    );
  }
}
