import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/image_constants.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/theme.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/cache_network_image_widget.dart';

class FashionableShortsWidget extends StatelessWidget {
  final int index;

  const FashionableShortsWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(0.5),
      width: context.sizeWidth(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Image.asset(index.isEven ? ImageConstants.shorts1 : ImageConstants.shorts2, fit: BoxFit.fill)),
          ListTile(
            title: Text(TextConstant.fashionableShorts.tr(), style: context.textTheme.titleSmall),
            subtitle: Text('N10,500', style: context.textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}

class FashionableShortsWidget2 extends StatelessWidget {
  final List<String>? imgKeyWords;
  final String? title;

  const FashionableShortsWidget2({super.key, this.imgKeyWords, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.c12,
          child: CachedNetworkImageWidget(
            imgUrl: faker.image.loremPicsum(seed: imgKeyWords?.join() ?? 'Fashion'),
            height: 150,
            width: context.sizeWidth(0.4),
          ),
        ),
        ListTile(
          title: Text(title ?? TextConstant.fashionableShorts.tr(), style: context.textTheme.titleSmall),
          subtitle: Text('N10,500', style: context.textTheme.titleMedium),
        ),
      ],
    );
  }
}
