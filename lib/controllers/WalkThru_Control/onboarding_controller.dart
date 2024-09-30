import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturemedix/api/plant.dart';
import 'package:naturemedix/data/PlantData/plant_data.dart';
import 'package:naturemedix/models/plant_model.dart';
import '../../data/list.dart';
import '../../routes/screen_routes.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadPlants();
    loadRemedies();
  }

  void loadPlants() {
    fetchPlants().then((data) {
      plants = List.generate(
        data.length,
        (index) => PlantBasicInfo(
          plantid: data[index]['plantid'] ?? 0,
          plantName: data[index]['plant_name'] ?? 'unknown',
          scientificName: data[index]['scientific_name'] ?? 'unknown',
          plantImage: data[index]['image'] ?? 'no data',
          description: data[index]['description'] ?? 'no data',
          create_at: data[index]['create_at'] ?? 'no data',
          update_at: data[index]['update_at'] ?? 'no data',
        ),
      ).toList();
      print(data);
    }).catchError((error) {
      log('Error fetching plants: $error');
    });
  }

  void loadRemedies() {
    fetchRemedies().then((data) {
      remedies = List.generate(
        data.length,
        (index) => RemedyInfo(
          remid: data[index]['remedyid'] ?? 0,
          plantid: data[index]['plantid'] ?? 0,
          remedyName: 'unknown',
          remedyType: 'unknown',
          description: data[index]['description'] ?? 'no data',
          remedyImage: data[index]['image'] ?? 'no data',
          treatments:
              data[index]['treatment'].toString().trim().split(',') ?? [],
          create_at: data[index]['create_at'] ?? 'no data',
          update_at: data[index]['update_at'] ?? 'no data',
        ),
      ).toList();
      print(data);
    }).catchError((error) {
      log('Error fetching remedies: $error');
    });
  }

  final _pageController = PageController();
  final _onboard_info = ONBOARD_INFO;
  var selectedPage = 0.obs;

  get isMaxPage => selectedPage.value == onboardCount - 1;
  get onboardInfo => _onboard_info;
  get onboardCount => _onboard_info.length;
  PageController get pageController => _pageController;

  void nextPage() {
    if (isMaxPage) {
      Get.toNamed(ScreenRouter.getGetstartedRoute);
      return;
    }

    selectedPage++;
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.linear);
  }

  void skipPage() {
    if (isMaxPage) {
      Get.toNamed(ScreenRouter.getGetstartedRoute);
      return;
    }

    selectedPage.value = onboardCount;
    pageController.animateToPage(
      onboardCount,
      duration: 300.milliseconds,
      curve: Curves.linear,
    );
  }
}
