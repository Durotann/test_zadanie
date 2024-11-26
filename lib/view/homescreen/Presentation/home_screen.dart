import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_zadanie/view/nomerscreen/Presentation/nomer_screen.dart';

import '../bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int activeIndex = 0;
  @override
  void initState() {
    context.read<HomeScreenBloc>().add(HomeScreenLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomeScreenLoadInf) {
            return Scaffold(
              backgroundColor: Colors.white10,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Отель",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 22 / 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(alignment: Alignment.bottomCenter, children: [
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 247,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  onPageChanged: (index, reason) => setState(
                                    () => activeIndex = index,
                                  ),
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                ),
                                itemCount: state.data.image_urls.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    width: 400,
                                    height: 257,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              '${state.data.image_urls[index]}',
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                return const CircularProgressIndicator();
                                              },
                                            ).image)),
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: state.data.image_urls
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () =>
                                            carouselController.animateTo(12,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.linear),
                                        child: Container(
                                          width: 10.0,
                                          height: 10.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      activeIndex == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: 149,
                              height: 29,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(255, 199, 0, 0.20),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color.fromRGBO(255, 168, 0, 1),
                                      size: 14,
                                    ),
                                    Text(
                                      "${state.data.rating} ${state.data.rating_name}",
                                      style: const TextStyle(
                                        fontFamily: "SF Pro Display",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(255, 168, 0, 1),
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${state.data.name}",
                              style: const TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                                height: 26 / 22,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${state.data.adress}",
                              style: const TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(13, 114, 255, 1),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "от ${state.data.minimal_price} ₽",
                                    style: const TextStyle(
                                      fontFamily: "SF Pro Display",
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                      height: 36 / 30,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "${state.data.price_for_it}",
                                      style: const TextStyle(
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
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      height: 528,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Об отеле",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                                height: 26 / 22,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 92,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Text(
                                      "${state.data.abouthotel.peculiarities[0]}",
                                      style: const TextStyle(
                                        fontFamily: "SF Pro Display",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff828796),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  width: 178,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100],
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Text(
                                        "${state.data.abouthotel.peculiarities[1]}",
                                        style: const TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff828796),
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 165,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100],
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Text(
                                        "${state.data.abouthotel.peculiarities[2]}",
                                        style: const TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff828796),
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Container(
                                    width: 122,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100],
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        child: Text(
                                          "${state.data.abouthotel.peculiarities[3]}",
                                          style: const TextStyle(
                                            fontFamily: "SF Pro Display",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff828796),
                                          ),
                                          textAlign: TextAlign.center,
                                        ))),
                              ],
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Text(
                              "${state.data.abouthotel.description}",
                              style: const TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              color: Colors.white,
                              width: 343,
                              height: 284,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 15),
                                    child: Container(
                                      width: 313,
                                      height: 38,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "images/emoji-happy.png",
                                                color: Colors.black,
                                                scale: 4,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Удобства",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff2c3035),
                                                      height: 19 / 16,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    "Самое необходимое",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff828796),
                                                      height: 17 / 14,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.keyboard_arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 60.0, right: 10.0),
                                    child: const Divider(
                                      indent: 1,
                                      color: Colors.grey,
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 15),
                                    child: Container(
                                      width: 313,
                                      height: 38,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "images/tick-square.png",
                                                scale: 4,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Удобства",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff2c3035),
                                                      height: 19 / 16,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    "Самое необходимое",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff828796),
                                                      height: 17 / 14,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.keyboard_arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 60.0, right: 10.0),
                                    child: const Divider(
                                      indent: 1,
                                      color: Colors.grey,
                                      height: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 15),
                                    child: Container(
                                      width: 313,
                                      height: 38,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "images/close-square.png",
                                                scale: 4,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Удобства",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff2c3035),
                                                      height: 19 / 16,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    "Самое необходимое",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Display",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff828796),
                                                      height: 17 / 14,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.keyboard_arrow_right)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 60.0, right: 10.0),
                                    child: const Divider(
                                      indent: 1,
                                      color: Colors.grey,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 88,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Container(
                            width: 343,
                            height: 48,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromRGBO(13, 114, 255, 1)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const NomerScreen()));
                                },
                                child: const Text(
                                  "К выбору номера",
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          ;
          return Scaffold(
              body:
                  Container(child: Center(child: CircularProgressIndicator())));
        },
      ),
    );
  }
}
