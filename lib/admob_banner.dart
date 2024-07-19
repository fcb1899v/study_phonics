import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'extension.dart';

class AdBannerWidget extends HookWidget {
  const AdBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adLoaded = useState(false);
    final adFailedLoading = useState(false);
    final bannerAd = useState<BannerAd?>(null);
    final adUnitId = (!kDebugMode) ? dotenv.get("ANDROID_BANNER_UNIT_ID"): dotenv.get("ANDROID_BANNER_UNIT_ID");
    final testIdentifiers = ['2793ca2a-5956-45a2-96c0-16fafddc1a15'];

    Future<void> loadAdBanner() async {
      final adBanner = BannerAd(
        adUnitId: adUnitId,
        size: AdSize.largeBanner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            'Ad: $ad loaded.'.debugPrint();
            adLoaded.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            'Ad: $ad failed to load: $error'.debugPrint();
            adFailedLoading.value = true;
            Future.delayed(const Duration(seconds: 30), () {
              if (!adLoaded.value && !adFailedLoading.value) {
                loadAdBanner();
              }
            });
          },
        ),
      );
      if (Platform.isAndroid) {
        adBanner.load();
        bannerAd.value = adBanner;
      }
    }

    useEffect(() {
      ConsentInformation.instance.requestConsentInfoUpdate(ConsentRequestParameters(
        // consentDebugSettings: ConsentDebugSettings(
        //   debugGeography: DebugGeography.debugGeographyEea,
        //   testIdentifiers: testIdentifiers,
        // ),
      ), () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          ConsentForm.loadConsentForm((ConsentForm consentForm) async {
            var status = await ConsentInformation.instance.getConsentStatus();
            "status: $status".debugPrint();
            if (status == ConsentStatus.required) {
              consentForm.show((formError) async => await loadAdBanner());
            } else {
              await loadAdBanner();
            }
          }, (formError) {});
        } else {
          await loadAdBanner();
        }
      }, (FormError error) {});
      "bannerAd: ${bannerAd.value}".debugPrint();
      return () => bannerAd.value?.dispose();      // unmount時に広告を破棄する
    }, []);

    return Container(
      // color: Colors.red,
      width: context.admobWidth(),
      height: context.admobHeight(),
      child: (adLoaded.value && Platform.isAndroid) ? AdWidget(ad: bannerAd.value!): null,
    );
  }
}