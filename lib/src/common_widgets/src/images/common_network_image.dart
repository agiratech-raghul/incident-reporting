import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_indicator.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';

class CommonNetworkImage extends StatelessWidget {
  final String image;
  final String? placeHolder;
  final double? height;
  final double? width;

  const CommonNetworkImage(
      {Key? key,
      required this.image,
      this.placeHolder,
      this.height,
      this.width})
      : super(key: key);
  @override
  Widget build(
    BuildContext context,
  ) {
    return Image.network(
      image,
      height: height,
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return Center(
            child: CommonIndicator(
              backgroundColor: Colors.white70,
              value: bytesLoaded / totalBytes,
              strokeWidth: 5.0,
            ),
          );
        } else {
          return child;
        }
      },
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          placeHolder ?? AppAssets.sampleImage,
        );
      },
    );
  }
}
