// ignore_for_file: omit_local_variable_types

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/config/constants/enums.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/app_border_radius.dart';
import 'package:flutter_meets_igbo/config/theme/app_style.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/config/theme/igbo_locale_color.dart';
import 'package:flutter_meets_igbo/main.dart';
import 'package:flutter_meets_igbo/src/home/provider/home_controller.dart';
import 'package:flutter_meets_igbo/src/home/views/widgets/widgets.dart';
import 'package:flutter_meets_igbo/src/onboard/views/sign_in_screen.dart';
import 'package:flutter_meets_igbo/src/utils/navigation_helper.dart';
import 'package:flutter_meets_igbo/src/utils/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    List<String> tabsString = [
      TextConstant.all.tr(),
      TextConstant.fashion.tr(),
      TextConstant.sport.tr(),
      TextConstant.phones.tr(),
      TextConstant.electronics.tr(),
    ];
    // log(SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenRefresh.name));
    return DefaultTabController(
      length: tabsString.length,
      child: Scaffold(
        //APP BAR
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 60,
          titleSpacing: 15,
          toolbarHeight: kToolbarHeight * 1.4,
          leading: GestureDetector(
            onTap: () {
              homeController.jumpToBottomNavIndex(3);
            },
            child: CircleAvatar(backgroundImage: NetworkImage(faker.image.image(keywords: ['face', 'portrait']), scale: 0.6)).padOnly(left: 10),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextConstant.hello.tr()),
              Text(TextConstant.getFullName(), textScaleFactor: 0.9, style: context.textTheme.bodyMedium?.copyWith(fontWeight: AppFontWeight.w700)),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                SharedPreferencesHelper.removePref(SharedPrefKeys.tokenAccess.name);
                pushReplacementOnRootNav(context, const LoginScreen());
              },
              child: Text(TextConstant.signOut.tr()),
            ),
          ].rowInPadding(15),
          centerTitle: false,
        ),

        //BODY OF THE SCREEN
        body: ListView(
          controller: scrollController,
          padding: AppEdgeInsets.eH20,
          children: [
            //SEARCH WIDGET
            SearchWidgetRow(),
            Row(children: [Expanded(child: Text(TextConstant.popularItems.tr())), Text(TextConstant.viewAll.tr())]),

            //CAROUSEL SLIDER
            ListenableBuilder(
              listenable: Listenable.merge([homeController]),
              builder:
                  (context, _) => Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: carouselWidgetList(context),
                        carouselController: homeController.carouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          // enlargeCenterPage: true,
                          // viewportFraction: 0.7,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {
                            homeController.setCarouselIndex(index);
                          },
                        ),
                      ),
                      carouselDots(context, homeController.carouselIndex, length: carouselWidgetList(context).length),
                    ].columnInPadding(15),
                  ),
            ),

            // THE TAB BAR OF ['ALL', 'FASHION', 'SPORTS', 'PHONES', 'ELECTRONICS']
            TabBar(
              isScrollable: true,
              labelColor: context.textTheme.bodyMedium!.color,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: IgboLocaleColor.indicatorActiveColor,
              splashFactory: NoSplash.splashFactory,

              onTap: (value) {
                log(value.toString());
              },

              // THE TABS BEARING THE CHILDREN
              tabs: List.generate(5, (index) => Tab(text: tabsString[index].tr().toTitleCase()), growable: true),
            ),
            SizedBox(
              height: context.sizeHeight(0.5),
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  TabBarViewChildren(scrollController: scrollController),
                  TabBarViewChildren(scrollController: scrollController, childWidget: FashionableShortsWidget2()),
                  TabBarViewChildren(
                    scrollController: scrollController,
                    itemCount: 10,
                    childWidget: FashionableShortsWidget2(imgKeyWords: ['Sports', 'football'], title: faker.sport.name()),
                  ),
                  TabBarViewChildren(
                    scrollController: scrollController,
                    childWidget: FashionableShortsWidget2(imgKeyWords: ['devices', 'mobile', 'phone'], title: faker.internet.userName()),
                  ),
                  TabBarViewChildren(
                    scrollController: scrollController,
                    childWidget: FashionableShortsWidget2(imgKeyWords: ['electronics', 'gadgets'], title: faker.company.name()),
                  ),
                ],
              ),
            ),
            //
          ].columnInPadding(30),
        ),
      ),
    );
  }

  List<Widget> carouselWidgetList(BuildContext context) {
    return [carouselWidget(context), carouselWidget(context), carouselWidget(context), carouselWidget(context)];
  }
}
