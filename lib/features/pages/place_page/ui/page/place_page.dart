import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';

class PlacePage extends StatelessWidget {
  final PlaceModel place;
  
  const PlacePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(place.name),
        backgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      child:SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: place.imagePath,
              child: Image.asset(
                place.imagePath,
                width: double.maxFinite,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(place.description),
            ),
          ],
        ),
      ),
    );
  }
}