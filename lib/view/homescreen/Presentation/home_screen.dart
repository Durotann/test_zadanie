import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homescreenbloc = HomeScreenBloc();
  int activeIndex = 0;
  @override
  void initState() {
    _homescreenbloc.add(HomeScreenLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: _homescreenbloc,
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomeScreenLoadInf) {
            return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    "Отель",
                    style: const TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                      height: 22 / 18,
                    ),
                    textAlign: TextAlign.center,
                  )),
              body: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 247,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: true,
                      reverse: false,
                      onPageChanged: (index, reason) => setState(
                        () => activeIndex = index,
                      ),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: state.data.image_urls.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 343,
                            height: 257,
                            margin: EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(i).image)),
                          );
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          }
          ;
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
