import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_zadanie/view/bronscreen/Presentation/bron_screen.dart';
import 'package:test_zadanie/view/nomerscreen/bloc/nomer_bloc.dart';

import '../../homescreen/bloc/home_screen_bloc.dart';

class NomerScreen extends StatefulWidget {
  const NomerScreen({super.key});

  @override
  State<NomerScreen> createState() => _NomerScreenState();
}

class _NomerScreenState extends State<NomerScreen> {
  final CarouselController carouselController = CarouselController();
  int activeIndex = 0;
  @override
  void initState() {
    context.read<HomeScreenBloc>().add(HomeScreenLoad());
    context.read<NomerBloc>().add(NomerLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
      if (state is HomeScreenLoadInf) {
        return BlocBuilder<NomerBloc, NomerState>(
            builder: (context, statenomer) {
          if (statenomer is NomerScreenLoadInf) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white70,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    "${state.data.name}",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  centerTitle: true,
                ),
                body: ListView.builder(
                    itemCount: statenomer.data1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: 375,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CarouselSlider.builder(
                                        options: CarouselOptions(
                                          height: 247,
                                          viewportFraction: 1,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          onPageChanged: (index, reason) =>
                                              setState(
                                            () => activeIndex = index,
                                          ),
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.3,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                        itemCount: statenomer.data1.length,
                                        itemBuilder: (context, carouselIndex,
                                            realIndex) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              top: 16.0,
                                            ),
                                            child: Container(
                                              width: 400,
                                              height: 257,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        '${statenomer.data1[index].image_urls[carouselIndex]}',
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          return const CircularProgressIndicator();
                                                        },
                                                      ).image)),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 70,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: statenomer.data1
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              return GestureDetector(
                                                onTap: () => carouselController
                                                    .animateTo(12,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.linear),
                                                child: Container(
                                                  width: 10.0,
                                                  height: 10.0,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.white
                                                              : Colors.black)
                                                          .withOpacity(
                                                              activeIndex ==
                                                                      entry.key
                                                                  ? 0.9
                                                                  : 0.4)),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )
                                    ]),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${statenomer.data1[index].name}",
                                    style: TextStyle(
                                      fontFamily: "SF Pro Display",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 103,
                                        height: 19,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "${statenomer.data1[index].peculiarities[0]}",
                                          style: TextStyle(
                                            fontFamily: "SF Pro Display",
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff828796),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 103,
                                        height: 19,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            "${statenomer.data1[index].peculiarities[1]}",
                                            style: TextStyle(
                                              fontFamily: "SF Pro Display",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff828796),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 230,
                                        height: 29,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                    255, 220, 233, 255)
                                                .withOpacity(1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                "Подробнее о номере",
                                                style: TextStyle(
                                                  fontFamily: "SF Pro Display",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0x0D72FF)
                                                      .withOpacity(1),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                size: 26,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${statenomer.data1[index].price} ₽",
                                        style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000),
                                          height: 36 / 30,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "${statenomer.data1[index].price_per}",
                                          style: TextStyle(
                                            fontFamily: "SF Pro Display",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff828796),
                                            height: 19 / 16,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromRGBO(
                                                        13, 114, 255, 1)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ))),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BronScreen()));
                                        },
                                        child: const Text(
                                          "Выбрать номер",
                                          style: TextStyle(
                                            fontFamily: "SF Pro Display",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          }
          ;
          return Scaffold(
              body:
                  Container(child: Center(child: CircularProgressIndicator())));
        });
      }
      ;
      return Scaffold(
          body: Container(child: Center(child: CircularProgressIndicator())));
    });
  }
}
