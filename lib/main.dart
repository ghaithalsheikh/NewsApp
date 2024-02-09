import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/Hive/article_model_adapter.dart';
import 'package:news_app/Hive/constant.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/view/home_pages.dart';
import 'package:news_app/provider/provider_nameLanguage.dart';
import 'package:news_app/provider/provider_theme.dart';
import 'package:news_app/viewmodel/viewmodel_news.dart';
import 'package:news_app/viewmodel/viewmodel_news_search.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive for Flutter
  Hive.registerAdapter(ArticleModelAdapter()); // Register the adapter
  await Hive.openBox<ArticleModel>(HiveBoxes.newsBox);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('ar', 'SA'), // Arabic
        Locale('fr', 'FR'), // French
        Locale('de', 'DE'), // German
        Locale('tr', 'TR'), // Turkish
        Locale('ru', 'RU'), // Russian
      ],
      path: 'assets/translations', // Path to translations directory
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ProviderTheme>(
            create: (context) => ProviderTheme(),
            child: const NewsApp(),
          ),
          ChangeNotifierProvider<NewsViewModel>(
            create: (context) => NewsViewModel(),
            child: NewsApp(),
          ),
          ChangeNotifierProvider<NewsSearchViewModel>(
            create: (context) => NewsSearchViewModel(),
            child: NewsApp(),
          ),
          ChangeNotifierProvider<ProviderNameLanguage>(
            create: (context) => ProviderNameLanguage(),
            child: NewsApp(),
          ),
        ],
        child: NewsApp(),
      ),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, __) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: Provider.of<ProviderTheme>(context, listen: true).toggle
              ? Provider.of<ProviderTheme>(context).dark
              : Provider.of<ProviderTheme>(context).light,
          debugShowCheckedModeBanner: false,
          // ignore: prefer_const_constructors
          home: HomeView(),
        );
      },
    );
  }
}
