import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/config/app_asset.dart';
import 'package:hotel/config/app_color.dart';
import 'package:hotel/controller/c_home.dart';
import 'package:hotel/page/history_page.dart';
import 'package:hotel/page/nearby_page.dart';
import 'package:hotel/widget/coming_soon.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconNearby, 'label': 'Nearby'},
    {'icon': AppAsset.iconHistory, 'label': 'History'},
    {'icon': AppAsset.iconPayment, 'label': 'Payment'},
    {'icon': AppAsset.iconReward, 'label': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 0) {
          return NearbyPage();
        }
        if (cHome.indexPage == 1) {
          return const HistoryPage();
        }
        return const ComingSoon();
      }),
      bottomNavigationBar: Obx(() {
          return Material(
            elevation: 8,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 6, top: 8),
              child: BottomNavigationBar(
                currentIndex: cHome.indexPage,
                onTap: (value) => cHome.indexPage = value,
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.black,
                selectedIconTheme: const IconThemeData(
                  color: AppColor.primary,
                ),
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                selectedFontSize: 12,
                items: listNav.map((e) {
                  return BottomNavigationBarItem(
                    icon: Image.asset(e['icon']),
                    label: e['label'],
                  );
                }).toList(),
              ),
            ),
          );
        }
      ),
    );
  }
}