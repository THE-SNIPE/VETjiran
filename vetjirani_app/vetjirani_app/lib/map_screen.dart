import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LocationData? _currentLocation;
  final Location _locationService = Location();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initLocation();
    _loadVetLocations();
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final location = await _locationService.getLocation();
    setState(() {
      _currentLocation = location;
    });
  }

  Future<void> _loadVetLocations() async {
    final csvString = await rootBundle.loadString('assets/kenya_vet_coordinates.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString, eol: '\n');

    Set<Marker> markers = {};
    for (int i = 1; i < csvTable.length; i++) {
      final row = csvTable[i];
      final name = row[0].toString();
      final lat = double.tryParse(row[2].toString()) ?? 0.0;
      final lng = double.tryParse(row[3].toString()) ?? 0.0;

      markers.add(
        Marker(
          markerId: MarkerId(name),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name),
        ),
      );
    }

    setState(() {
      _markers.addAll(markers);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Vet Map'),
          backgroundColor: const Color(0xFF121714),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final initialCameraPosition = CameraPosition(
      target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
      zoom: 12,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet Map'),
        backgroundColor: const Color(0xFF121714),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: _markers,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
