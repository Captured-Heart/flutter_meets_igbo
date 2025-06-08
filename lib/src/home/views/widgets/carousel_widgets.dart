import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/config/constants/image_constants.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/theme.dart';

Row carouselDots(BuildContext context, int currentIndex, {required int length}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      length,
      (index) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            // vertical: 8.0,
            horizontal: 4,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, color: currentIndex == index ? IgboLocaleColor.amberColor : IgboLocaleColor.textHint),
        ),
      ),
    ),
  );
}

Container carouselWidget(BuildContext context) {
  return Container(
    height: context.sizeHeight(0.2),
    width: context.sizeWidth(0.77),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(ImageConstants.upToSaleImg))),
    child: Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(bottom: 1, right: 1, child: Image.asset(ImageConstants.upToSaleAvatar)),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: context.sizeWidth(0.4),
                child: Text(
                  TextConstant.getYourSpecialSale.tr(),
                  maxLines: 2,
                  style: context.textTheme.headlineMedium?.copyWith(color: IgboLocaleColor.textDark),
                ),
              ),
              Container(
                padding: AppEdgeInsets.eA8,
                decoration: const BoxDecoration(color: IgboLocaleColor.textDark, borderRadius: AppBorderRadius.c8),
                child: Text(TextConstant.shopNow.tr(), style: context.textTheme.bodyLarge?.copyWith(color: context.theme.primaryColorDark)),
              ),
            ].columnInPadding(15),
          ),
        ).padOnly(left: 15, bottom: 5),
      ],
    ),
  );
}
