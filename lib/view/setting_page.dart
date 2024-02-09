import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/provider/provider_nameLanguage.dart';
import 'package:news_app/provider/provider_theme.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('Setting')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(6),
              ),
              Transform.scale(
                scale: ScreenUtil().setWidth(0.70),
                child: Switch(
                    value: Provider.of<ProviderTheme>(context, listen: false)
                        .toggle,
                    onChanged: (newValue) {
                      setState(() {
                        Provider.of<ProviderTheme>(context, listen: false)
                            .toggleTheme(newValue);
                      });
                    },
                    activeColor: Colors.indigo),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(5),
              ),
              Text(
                tr('Dark Mode'),
                style: TextStyle(fontSize: ScreenUtil().setSp(18)),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(12),
                left: ScreenUtil().setWidth(12)),
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  size: ScreenUtil().setWidth(32),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(12),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    iconSize: 0,
                    value: context.locale,
                    items: const [
                      DropdownMenuItem(
                        value: Locale('en', 'US'),
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: Locale('ar', 'SA'),
                        child: Text('العربية'),
                      ),
                      DropdownMenuItem(
                        value: Locale('fr', 'FR'),
                        child: Text('Français'),
                      ),
                      DropdownMenuItem(
                        value: Locale('de', 'DE'),
                        child: Text('Deutsch'),
                      ),
                      DropdownMenuItem(
                        value: Locale('tr', 'TR'),
                        child: Text('Türkçe'),
                      ),
                      DropdownMenuItem(
                        value: Locale('ru', 'RU'),
                        child: Text('Русский'),
                      ),
                    ],
                    onChanged: (Locale? newLocale) {
                      String? lang;
                      if (newLocale.toString() == 'ar_SA') {
                        lang = 'us';
                      } else if (newLocale.toString() == 'en_US') {
                        lang = 'us';
                      } else if (newLocale.toString() == 'fr_FR') {
                        lang = 'fr';
                      } else if (newLocale.toString() == 'de_DE') {
                        lang = 'de';
                      } else if (newLocale.toString() == 'tr_TR') {
                        lang = 'tr';
                      } else if (newLocale.toString() == 'ru_RU') {
                        lang = 'ru';
                      }
                      EasyLocalization.of(context)!.setLocale(newLocale!);
                      Provider.of<ProviderNameLanguage>(context, listen: false)
                          .setNameLanguage(lang!);
                      if (newLocale.toString() == selectedOption) {
                        selectedOption =
                            null; // Cancel the selection if it's the same value
                      } else {
                        selectedOption =
                            newLocale.toString(); // Update the selected option
                      }
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
