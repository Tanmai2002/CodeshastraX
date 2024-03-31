import 'package:get/get.dart';

import '../modules/CropImage/bindings/crop_image_binding.dart';
import '../modules/CropImage/views/crop_image_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/edu_shorts/bindings/edu_shorts_binding.dart';
import '../modules/edu_shorts/views/edu_shorts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/marketplace/bindings/marketplace_binding.dart';
import '../modules/marketplace/views/marketplace_view.dart';
import '../modules/tracking_page/bindings/tracking_page_binding.dart';
import '../modules/tracking_page/views/tracking_page_view.dart';
import '../modules/voice_assistant/bindings/voice_assistant_binding.dart';
import '../modules/voice_assistant/views/voice_assistant_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANGUAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.MARKETPLACE,
      page: () => const MarketplaceView(),
      binding: MarketplaceBinding(),
    ),
    GetPage(
      name: _Paths.EDU_SHORTS,
      page: () => const EduShortsView(),
      binding: EduShortsBinding(),
    ),
    GetPage(
      name: _Paths.TRACKING_PAGE,
      page: () => const TrackingPageView(),
      binding: TrackingPageBinding(),
    ),
    GetPage(
      name: _Paths.VOICE_ASSISTANT,
      page: () => VoiceAssistantView(),
      binding: VoiceAssistantBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.CROP_IMAGE,
      page: () => const CropImageView(),
      binding: CropImageBinding(),
    ),
  ];
}
