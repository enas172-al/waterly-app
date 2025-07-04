import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:waterly/container1.dart';
import 'package:waterly/addwater.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 0,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 273,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 0,
                children: [
                  SizedBox(
                    width: 270,
                    height: 235,
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        const Positioned(
                          top: 123.25,
                          left: 0,
                          child: Icon(
                            Icons.heart_broken_rounded,
                            color: Color(0xffbebebe),
                            size: 35,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 18,
                          width: 234,
                          height: 235.5,
                          child: Transform(
                            transform: Matrix4.rotationZ(11),
                            alignment: const Alignment(
                                -0.044943820224721986, -0.044943820224721986),
                            origin: const Offset(0, 0),
                            transformHitTests: true,
                            child: const CircularProgressIndicator(
                              value: 0.5,
                              color: Color(0xffc1c1c1),
                              trackGap: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 14),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 17.5,
                          left: 35,
                          width: 200,
                          height: 200,
                          child: Container1(),
                        ),
                        Positioned(
                          top: 131.25,
                          left: 66,
                          height: 27,
                          child: Text(
                            'هدف الشرب اليومي',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Positioned(
                          top: 104,
                          left: 97,
                          width: 15,
                          height: 27,
                          child: Text(
                            '0',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff25abe4)),
                          ),
                        ),
                        const Positioned(
                          top: 104,
                          left: 112,
                          width: 123,
                          height: 27.25,
                          child: Text(
                            '/ 2000 ml',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Positioned(
                          top: 175,
                          left: 122.5,
                          child: Icon(
                            Icons.local_drink_sharp,
                            color: Color(0xff25abe4),
                            size: 25,
                          ),
                        ),
                        const Positioned(
                          top: 123.25,
                          left: 235,
                          height: 35,
                          child: Icon(
                            Icons.water_drop,
                            color: Color(0xff25abe4),
                            size: 35,
                          ),
                        ),
                        Positioned(
                          top: 9,
                          left: 9,
                          width: 243,
                          height: 217,
                          child: Transform(
                            transform: Matrix4.rotationZ(11),
                            alignment: const Alignment(
                                -0.044943820224721986, -0.044943820224721986),
                            origin: const Offset(0, 0),
                            transformHitTests: true,
                            child: const CircularProgressIndicator(
                              value: 0.1,
                              color: Color(0xff25abe4),
                              trackGap: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 137,
                      height: null,
                      child: Addwater(
                        param1: '250 ml',
                        param: 'assets/images/sticker1.webp', // ← من الأصول (assets),
                      ),
                    ),
                    const SizedBox(
                      width: 137,
                      height: null,
                      child: Addwater(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: null,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 137,
                      height: null,
                      child: Addwater(
                        param1: '100  ml',
                        param: 'assets/images/stickerhhh.webp',
                      ),
                    ),
                    const SizedBox(
                      width: 137,
                      height: null,
                      child: Addwater(
                        param1: '170 ml',
                        param: 'assets/images/sticker.webp',
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 37,
                      child: Container(
                        decoration:
                        const BoxDecoration(color: Color(0x00c4c4c4)),
                      ),
                    ),
                    SizedBox(
                      width: null,
                      height: 44,
                      child: Row(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: null,
                            height: null,
                            child: Material(
                              color: const Color(0xfff4c73d),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0x00000000), width: 1),
                                  borderRadius: BorderRadius.circular(13)),
                              shadowColor: const Color(0xff000000),
                              surfaceTintColor: const Color(0xff000000),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Icon(
                                  Icons.add_outlined,
                                  color: Color(0xff000000),
                                  size: 24,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: null,
                      height: null,
                      child: Icon(
                        Icons.list_alt_sharp,
                        color: Color(0xff05188e),
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff53c9ff),
        title: Text(
          'تذكير بشرب المياه',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.settings_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            label: 'الاعدادات',
            backgroundColor: const Color(0xffffffff),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.water_drop_outlined,
              ),
            ),
            label: 'الصفحة الئيسية',
            backgroundColor: const Color(0xffffffff),
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.history_rounded,
                color: Color(0xff000000),
              ),
              label: 'المحفوظات')
        ],
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
        selectedItemColor: Theme.of(context).colorScheme.onSecondary,
        showSelectedLabels: true,
        currentIndex: pageIndex,
        onTap: (value) {
          pageIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
