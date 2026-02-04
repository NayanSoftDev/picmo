import 'package:get/get.dart';

import '../models/profile_model.dart';

class ProfileController extends GetxController {
  final Rx<ProfileModel> _profile = ProfileModel.empty().obs;

  ProfileModel get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();
    _loadProfileData();
  }

  void _loadProfileData() {
    final profileData = ProfileModel(
      uid: '1244134854547418572',
      name: 'Alex Ferguson',
      profession: 'Singer',
      galleryImages: [],
      hasVideos: false,
    );

    _profile.value = profileData;
  }

  void uploadPhoto() {}

  void addVideo() {}
}
