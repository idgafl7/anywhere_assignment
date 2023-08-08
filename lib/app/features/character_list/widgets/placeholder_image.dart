import 'package:anywhere_realestate_assignment/app/utils/constants/images.dart';
import 'package:flutter/material.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        Images.placeholder,
        fit: BoxFit.contain,
      ),
    );
  }
}
