import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMaps extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyMapsState();
  }

}
class MyMapsState extends State<MyMaps>{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.4435, 78.3772),
    zoom: 14.0,
  );
  List<MarkerId>listMarkerIds=List<MarkerId>.empty(growable: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(leading: const Icon(Icons.map),backgroundColor: Colors.blue,title: const Text("Google Maps With Markers"),),
        body: Container(
          child: GoogleMap(initialCameraPosition: _kGooglePlex,

            onTap: (_){

            },
            mapType: MapType.normal,
            markers: Set<Marker>.of(markers.values),

            onMapCreated: (GoogleMapController controler){
              _controller.complete(controler);

              MarkerId markerId1 = const MarkerId("1");
              MarkerId markerId2 = const MarkerId("2");
              MarkerId markerId3 = const MarkerId("3");

              listMarkerIds.add(markerId1);
              listMarkerIds.add(markerId2);
              listMarkerIds.add(markerId3);


              Marker marker1=Marker(
                  markerId: markerId1,
                  position: const LatLng(17.4435, 78.3772),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),infoWindow: InfoWindow(
                  title: "Hytech City",onTap: (){

                var  bottomSheetController=scaffoldKey.currentState!.showBottomSheet((context) => Container(
                  height: 250,
                  color: Colors.transparent,
                  child: getBottomSheet("17.4435, 78.3772"),
                ));

              },snippet: "Snipet Hitech City"
              ));

              Marker marker2=Marker(markerId: markerId2,position: const LatLng(17.4837, 78.3158),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),);
              Marker marker3=Marker(markerId: markerId3,position: const LatLng(17.5169, 78.3428),
                  infoWindow: InfoWindow(
                      title: "Miyapur",onTap: (){},snippet: "Miyapur"
                  ));

              setState(() {
                markers[markerId1]=marker1;
                markers[markerId2]=marker2;
                markers[markerId3]=marker3;
              });
            },

          ),
        )
    );
  }

  Widget getBottomSheet(String s)
  {
    return Stack(
      children: <Widget>[
        Container(

          margin: const EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Hytech City Public School \n CBSC",style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                      ),),
                      const SizedBox(height: 5,),
                      Row(children: const <Widget>[

                        Text("4.5",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        )),
                        Icon(Icons.star,color: Colors.yellow,),
                        SizedBox(width: 20,),
                        Text("970 Folowers",style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ))
                      ],),
                      const SizedBox(height: 5,),
                      const Text("Memorial Park",style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: <Widget>[const SizedBox(width: 20,),const Icon(Icons.map,color: Colors.blue,),const SizedBox(width: 20,),Text("$s")],
              ),
              const SizedBox(height: 20,),
              Row(
                children: const <Widget>[SizedBox(width: 20,),Icon(Icons.call,color: Colors.blue,),SizedBox(width: 20,),Text("040-123456")],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,

            child: FloatingActionButton(
                child: const Icon(Icons.navigation),
                onPressed: (){

                }),
          ),
        )
      ],
    );
  }
}




