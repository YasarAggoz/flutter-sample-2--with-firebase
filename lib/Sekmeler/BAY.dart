import 'package:belindaproje/Sekmeler/grafik.dart';
import 'package:belindaproje/Sekmeler/userpage.dart';
import 'package:belindaproje/araclar/navigator.dart';
import 'package:belindaproje/service/serviceapi.dart';
import 'package:flutter/material.dart';
import 'package:belindaproje/araclar/baslik.dart';
import 'package:belindaproje/araclar/KatUrun.dart';
import '../araclar/NavFactory.dart';
import 'ARAC.dart';
import 'BAYAN.dart';
import 'deneme.dart';
import 'homepage.dart';
import 'kategori.dart';
import 'login.dart';
class Kategoripage extends StatefulWidget {
  String KateBaslik ;
  Kategoripage(this.KateBaslik);

  @override
  State<Kategoripage> createState() => _Kategoripage();
}

class _Kategoripage extends State<Kategoripage> {
  int _currentindex = 0 ;
  api apservice = api();
  String gununsozu = "";
  @override
  void initState() {
    super.initState();
    apservice.gnszapi().then((value) {
      if (value != null) {
        setState(() {
          gununsozu = value.name! ;

        });
      } else {
        setState(() {

        });
      }
    });
  }
  List<Map> urun = [
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinda (501) Erkek","fiyat":"90" },
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinda (502) Erkek","fiyat":"90" },
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinda (503) Erkek","fiyat":"90" },
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinda (504) Erkek","fiyat":"90" },
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinde (505) Erkek","fiyat":"90" },
    { "fotograf":"assets/resimler/erkek.png","isim":"Belinde (506) Erkek","fiyat":"90" },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasLik("Deneme", context),
                  SizedBox(width:  15,),
                  Text("Günün Ürünü :$gununsozu", style: TextStyle( fontSize: 20, color: Colors.black38),),
                  const SizedBox(height: 15),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: TextButton(onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) =>  const grafik() ));
                    }, child: Text("Yıllık Parfüm Kullanım Oranı"), ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      navfactory(text: "Kategoriler", icon: Icons.menu , widget:kategorisf(), context: context),
                      navfactory(text: "Bay", icon: Icons.people , widget: Kategoripage("BAY"), context: context),
                      navfactory(text: "Bayan", icon: Icons.people_alt_outlined , widget: BayanPage("BAYAN"), context: context),
                      navfactory(text: "Oto", icon: Icons.car_rental , widget: AracPage("ARAC"), context: context),
                    ],
                  ),
                  Expanded(

                    child: GridView.count(
                      mainAxisSpacing: 35,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      children:
                      urun.map((Map urun)  {
                        return
                          KatUrun(urun["fotograf"], urun["isim"], urun["fiyat"],context);

                      }).toList(),
                    ),

                  ), SizedBox(height: 40),
                ],
              ),

            ),
            const SizedBox(height: 30),
            Align(

              alignment: Alignment.bottomCenter,
              child:
              BottomNavigationBar(
                currentIndex: _currentindex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white70,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home ),
                    label: 'homepage',
                    // backgroundColor: Colors.blue,

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search ),
                    label: 'search',
                    // backgroundColor: Colors.blue,

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop ),
                    label: 'shop',
                    // backgroundColor: Colors.blue,

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people ),
                    label: 'loginpage',
                    // backgroundColor: Colors.blue,

                  ),
                ],
                onTap: (index){
                  setState(() {
                    _currentindex = index ;
                    if (_currentindex == 3) {
                      Navigator.push (
                        context,
                        MaterialPageRoute(builder: (context) => userpage()),
                      );
                    }
                    if (_currentindex == 1) {
                      Navigator.push (
                        context,
                        MaterialPageRoute(builder: (context) => kategorisf()),
                      );
                    }
                    if (_currentindex == 2) {
                      Navigator.push (
                        context,
                        MaterialPageRoute(builder: (context) => Sepet()),
                      );
                    }
                    if (_currentindex == 0) {
                      Navigator.push (
                        context,
                        MaterialPageRoute(builder: (context) => Homapage()),
                      );
                    }

                  });
                },
              ),

            ),

          ],
        ),
      ),
    );
  }
}
