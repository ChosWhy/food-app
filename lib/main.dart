import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:food_app/project_consts.dart';
import 'package:food_app/unknow_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const MainPage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => const OnUnKnowPage(),),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ProjectColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          centerTitle: true,
        )
      ),
      title: "Food App Demo",
    );
  }
}


///projede gereksiz biryerlerden veri akısı var bunu düzelt bunun düzeltilmesi ise projenin
///bir akısı olması bu da su sekilde olucaktır :
///önce restaurantı alıcan restauranttan productı alıcan veriler!
///restaurant veerilerini de generalDatasdan cekiceksin
///o datas verilerini bi güzel temiz hale getir kalan kısım suanlık bu
///
/// 1.etap ise su productları hazır hale getirdikten sonra restaurantPage dosyasındaki menu
/// widgetlarına basıldıgında bi product sayfası acılsın ve o sekilde orda listelensin
/// productlar
/// ama menu kısmında tercşhedilenler aktif bunu diger menulere basıldıgında ise su islem olsun yeni sayfada acılsın onu ayarlıcaz
/// o sayfayı olusturucaz en son da veri akşını temiz sekilde saglıcaz!
///
///
/// !!!yaptıklarım 1.etap okey
/// şimdi işte verileri classtan classa aktarıcam ve en son menu butonlarına basılınca o menuyle alakalı
/// ürünleri sıralatıcam!!