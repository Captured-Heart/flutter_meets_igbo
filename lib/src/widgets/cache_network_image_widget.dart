import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/image_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String? imgUrl;
  final double height;
  final double? width;
  final BoxFit? fit;
  final bool? isProgressIndicator;

  const CachedNetworkImageWidget({super.key, required this.imgUrl, required this.height, this.width, this.fit, this.isProgressIndicator = false});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl ?? ImageConstants.noImagePlaceholderHttp,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fill,

      progressIndicatorBuilder: (context, string, progress) {
        // ignore: use_if_null_to_convert_nulls_to_bools
        return isProgressIndicator == true
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Container(
              alignment: Alignment.center,
              height: height,
              width: width ?? context.sizeWidth(1),
              decoration: BoxDecoration(color: IgboLocaleColor.indicatorActiveColor, borderRadius: BorderRadius.circular(20)),
            );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(image: AssetImage(ImageConstants.noImagePlaceholder), fit: BoxFit.fill),
          ),
        );
      },
    );
  }
}
