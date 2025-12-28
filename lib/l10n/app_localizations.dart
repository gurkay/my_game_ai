import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'My Game AI'**
  String get appTitle;

  /// Home navigation label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Explore navigation label
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// Library navigation label
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Profile navigation label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// News section label
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// All news button
  ///
  /// In en, this message translates to:
  /// **'ALL NEWS'**
  String get allNews;

  /// Game details page title
  ///
  /// In en, this message translates to:
  /// **'Game Details'**
  String get gameDetails;

  /// System requirements page title
  ///
  /// In en, this message translates to:
  /// **'System Requirements'**
  String get systemRequirements;

  /// Minimum requirements tab
  ///
  /// In en, this message translates to:
  /// **'Minimum'**
  String get minimum;

  /// Recommended requirements tab
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Device compatibility section
  ///
  /// In en, this message translates to:
  /// **'Device Compatibility'**
  String get deviceCompatibility;

  /// Performance section
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// Forum page title
  ///
  /// In en, this message translates to:
  /// **'Forum'**
  String get forum;

  /// Ask question button
  ///
  /// In en, this message translates to:
  /// **'ASK QUESTION'**
  String get askQuestion;

  /// Search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search questions...'**
  String get searchQuestions;

  /// All filter
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Cheats page title
  ///
  /// In en, this message translates to:
  /// **'Cheats'**
  String get cheats;

  /// Search cheats placeholder
  ///
  /// In en, this message translates to:
  /// **'Search cheats, codes, guides...'**
  String get searchCheats;

  /// Popular games section
  ///
  /// In en, this message translates to:
  /// **'Popular Games'**
  String get popularGames;

  /// AI assistant title
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// AI assistant description
  ///
  /// In en, this message translates to:
  /// **'Can\'t find the cheat you\'re looking for? Try our AI assistant!'**
  String get aiDescription;

  /// Try AI button
  ///
  /// In en, this message translates to:
  /// **'TRY AI'**
  String get tryAI;

  /// Cheat detail page title
  ///
  /// In en, this message translates to:
  /// **'Cheat Detail'**
  String get cheatDetail;

  /// Cheat code label
  ///
  /// In en, this message translates to:
  /// **'CHEAT CODE'**
  String get cheatCode;

  /// Copy code button
  ///
  /// In en, this message translates to:
  /// **'Copy Code'**
  String get copyCode;

  /// Code copied message
  ///
  /// In en, this message translates to:
  /// **'Code copied!'**
  String get codeCopied;

  /// Description section
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// How to use section
  ///
  /// In en, this message translates to:
  /// **'How to Use?'**
  String get howToUse;

  /// Gameplay video section
  ///
  /// In en, this message translates to:
  /// **'Gameplay Video'**
  String get gameplayVideo;

  /// Comments section
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// View all button
  ///
  /// In en, this message translates to:
  /// **'VIEW ALL'**
  String get viewAll;

  /// Write comment placeholder
  ///
  /// In en, this message translates to:
  /// **'Write a comment...'**
  String get writeComment;

  /// Reply button
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// My profile title
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// Edit profile button
  ///
  /// In en, this message translates to:
  /// **'EDIT PROFILE'**
  String get editProfile;

  /// Stats tab
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// Achievements tab
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// Favorite games section
  ///
  /// In en, this message translates to:
  /// **'Favorite Games'**
  String get favoriteGames;

  /// Add game button
  ///
  /// In en, this message translates to:
  /// **'Add Game'**
  String get addGame;

  /// Settings label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Turkish language
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// English language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Select language dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
