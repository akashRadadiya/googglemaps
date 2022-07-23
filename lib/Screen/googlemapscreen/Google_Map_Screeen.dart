import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googglemaps/Screen/googlemapscreen/locationcontroller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  var Controller = Get.put(HomeController());

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(

          markerId: const MarkerId('id1'),
          position: const LatLng(21.1884236, 72.8147105),
          infoWindow: InfoWindow(
            title: 'ADDRESS',
            snippet: Controller.address.value,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Google Map"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(21.1884236, 72.8147105), zoom: 15),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: const Icon(Icons.location_on_sharp,size: 40,),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(Controller.address.value),

                            ),
                            Text(Controller.latitude.value),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(Controller.longitude.value),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )

    );
  }
}
