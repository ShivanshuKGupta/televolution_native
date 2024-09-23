// ignore_for_file: non_constant_identifier_names, unused_element
part of 'app_strings_model.dart';

extension AllStrings on AppStringsModel {
  String get screensaver_user_select => this['screensaver_user_select'];
  String get account => this['account'];
  String get home_recommended_shows => this['home_recommended_shows'];
  String get itinerary => this['itinerary'];
  String get live_tv => this['live_tv'];
  String get video_on_demand => this['video_on_demand'];
  String get watch_history => this['watch_history'];
  String get welcome_message => this['welcome_message'];
  int get current_day => int.tryParse(this['current_day'].toString()) ?? 0;
}
