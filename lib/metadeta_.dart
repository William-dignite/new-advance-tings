import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MusicMetaDetaWidget extends StatelessWidget {
  const MusicMetaDetaWidget(
      {super.key,
      required this.songTitle,
      required this.songImage,
      required this.artistName,
      required this.songDesc});

  final String songTitle;
  final String songImage;
  final String artistName;
  final String songDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
                height: 340,
                width: MediaQuery.sizeOf(context).width,
                imageUrl: songImage,
                fit: BoxFit.cover),
          ),
        ),
        Text(
          songTitle, //'Garden City',
        ),
        Text(
          artistName, //'Thomas Austin',
        ),
        Text(
          songDesc,
        ),
      ],
    );
  }
}
