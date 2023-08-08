import 'package:anywhere_realestate_assignment/app/features/character_list/widgets/placeholder_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String? url;
  const CharacterImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: (url != null && url!.isNotEmpty)
          ? CachedNetworkImage(
              imageUrl: "https://duckduckgo.com/$url",
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const PlaceHolderImage(),
            )
          : const PlaceHolderImage(),
    );
  }
}
