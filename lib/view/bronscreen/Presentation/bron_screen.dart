import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_zadanie/data/repositories/repository3.dart';
import 'package:test_zadanie/view/bronscreen/bloc/bron_bloc.dart';
import 'package:test_zadanie/view/bronscreen/widgets/sumtext.dart';
import 'package:test_zadanie/view/homescreen/Presentation/home_screen.dart';

import '../../donescreen/Presentation/donescreen.dart';
import '../../nomerscreen/bloc/nomer_bloc.dart';
import '../widgets/textfield.dart';

class BronScreen extends StatefulWidget {
  const BronScreen({super.key});

  @override
  State<BronScreen> createState() => _BronScreenState();
}

class _BronScreenState extends State<BronScreen> {
  List<Widget> containers = [];
  bool _customTileExpanded = false;
  @override
  void initState() {
    context.read<BronBloc>().add(BronLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BronBloc, BronState>(builder: (context, state) {
      if (state is BronLoading) {
        return Scaffold(
            body: Container(child: Center(child: CircularProgressIndicator())));
      }
      if (state is BronLoadInf) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(
              "Бронирование",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                width: 149,
                                height: 29,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 199, 0, 0.20),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(255, 168, 0, 1),
                                        size: 14,
                                      ),
                                      Text(
                                        "${state.data.horating}\t${state.data.rating_name}",
                                        style: TextStyle(
                                          fontFamily: "SF Pro Display",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(255, 168, 0, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${state.data.hotel_name}",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${state.data.hotel_adress}",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(13, 114, 255, 1),
                                height: 17 / 14,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Вылет из",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 71,
                                ),
                                Text(
                                  "${state.data.departure}",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Страна, город",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 31,
                                ),
                                Text(
                                  "${state.data.arrival_country}",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Даты",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 103,
                                ),
                                Text(
                                  "${state.data.tour_date_start} – ${state.data.tour_date_stop}",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Кол-во ночей",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 37,
                                ),
                                Text(
                                  "${state.data.number_of_nights} ночей",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Отель",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 97,
                                ),
                                Text(
                                  "${state.data.hotel_name}",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Номер",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 91,
                                ),
                                Text(
                                  "Стандартный с видом \nна бассейн или сад",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Питание",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff828796),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 79,
                                ),
                                Text(
                                  "Все включено",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                    height: 19 / 16,
                                  ),
                                  textAlign: TextAlign.left,
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
                    height: 262,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text(
                                  "Информация о покупателе",
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    height: 26 / 22,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MyTextField(
                                title: 'Номер телефона',
                                keyboardtype: TextInputType.number,
                              ),
                              MyTextField(
                                title: 'Почта',
                                keyboardtype: TextInputType.emailAddress,
                              ),
                              Text(
                                'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                                style: TextStyle(
                                  color: Color(0xFF828796),
                                  fontSize: 14,
                                  // fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    // maintainState: false,
                    title: Text(
                      "Первый турист",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 26 / 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                              title: 'Имя',
                            ),
                            MyTextField(
                              title: 'Фамилия',
                            ),
                            MyTextField(
                              title: 'Дата рождения',
                            ),
                            MyTextField(
                              title: 'Гражданство',
                            ),
                            MyTextField(
                              title: 'Номер загранпаспорта',
                            ),
                            MyTextField(
                              title: 'Срок действия загранпаспорта',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ExpansionTile(
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    // maintainState: false,
                    title: Text(
                      "Второй турист",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 26 / 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                              title: 'Имя',
                            ),
                            MyTextField(
                              title: 'Фамилия',
                            ),
                            MyTextField(
                              title: 'Дата рождения',
                            ),
                            MyTextField(
                              title: 'Гражданство',
                            ),
                            MyTextField(
                              title: 'Номер загранпаспорта',
                            ),
                            MyTextField(
                              title: 'Срок действия загранпаспорта',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 156,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        children: [
                          SumText(
                            textapi: state.data.tour_price,
                            text: "Тур",
                            colors: null,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SumText(
                            textapi: state.data.fuel_charge,
                            text: "Топливный сбор",
                            colors: null,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SumText(
                            textapi: state.data.service_charge,
                            text: "Сервисный сбор",
                            colors: null,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SumText(
                            textapi: state.data.tour_price +
                                state.data.fuel_charge +
                                state.data.service_charge,
                            text: "К оплате",
                            colors: Color.fromRGBO(13, 114, 255, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    height: 88,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          width: 343,
                          height: 58,
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
                                    builder: (context) => const DoneScreen()));
                              },
                              child: Text(
                                "Оплатить ${state.data.tour_price + state.data.fuel_charge + state.data.service_charge}",
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
          ),
        );
      }
      ;
      return Scaffold(
          body: Container(child: Center(child: CircularProgressIndicator())));
    });
  }
}
