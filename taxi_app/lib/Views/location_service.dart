import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: const Color(0xFFF8F8F8)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 812,
                  decoration: BoxDecoration(color: const Color(0xFFD8D8D8)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 812,
                  decoration: BoxDecoration(color: const Color(0xFFD8D8D8)),
                ),
              ),
              Positioned(
                left: -109,
                top: -76.40,
                child: Container(
                  width: 627,
                  height: 896,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/627x896"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 98,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 375,
                          height: 98,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6938D3),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x21000000),
                                blurRadius: 48,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 138,
                        top: 52,
                        child: Text(
                          'Select Ride',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFEFFFE),
                            fontSize: 16,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.86,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 206,
                top: 231,
                child: Container(
                  width: 107,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 244,
                child: Container(
                  width: 79,
                  height: 14,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Thayne',
                                style: TextStyle(
                                  color: const Color(0xFF1E2022),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                              ),
                              TextSpan(
                                text: '…',
                                style: TextStyle(
                                  color: const Color(0xFF1E2022),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 161,
                top: 231,
                child: Container(
                  width: 45,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF6938D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 174,
                top: 238,
                child: Container(
                  width: 19,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 5,
                        top: 0,
                        child: Text(
                          '6',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 14,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'mi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.80,
                                ),
                              ),
                              TextSpan(
                                text: 'n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 366,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 379,
                child: Container(
                  width: 93,
                  height: 14,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Abingdon',
                                style: TextStyle(
                                  color: const Color(0xFF1E2022),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                              ),
                              TextSpan(
                                text: '…',
                                style: TextStyle(
                                  color: const Color(0xFF1E2022),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 581,
                child: Container(
                  width: 250,
                  height: 181,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 551,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD8D8D8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 551,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD8D8D8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 703,
                child: Container(
                  width: 214,
                  height: 1,
                  decoration: BoxDecoration(color: const Color(0xFFEEEEEE)),
                ),
              ),
              Positioned(
                left: 139,
                top: 718,
                child: Container(
                  width: 1,
                  height: 26,
                  decoration: BoxDecoration(color: const Color(0xFFF0F0F0)),
                ),
              ),
              Positioned(
                left: 29,
                top: 653,
                child: Container(
                  width: 133,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          'Malcolm Function',
                          style: TextStyle(
                            color: const Color(0xFF1E2022),
                            fontSize: 14,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 22,
                        child: Text(
                          'Turquoise Taxi',
                          style: TextStyle(
                            color: const Color(0xFF77838F),
                            fontSize: 12,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 274,
                top: 581,
                child: Container(
                  width: 250,
                  height: 181,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 292,
                top: 551,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD8D8D8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 292,
                top: 551,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD8D8D8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 48,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 292,
                top: 703,
                child: Container(
                  width: 214,
                  height: 1,
                  decoration: BoxDecoration(color: const Color(0xFFEEEEEE)),
                ),
              ),
              Positioned(
                left: 399,
                top: 718,
                child: Container(
                  width: 1,
                  height: 26,
                  decoration: BoxDecoration(color: const Color(0xFFF0F0F0)),
                ),
              ),
              Positioned(
                left: 289,
                top: 653,
                child: Container(
                  width: 111,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          'Douglas Lyphe',
                          style: TextStyle(
                            color: const Color(0xFF1E2022),
                            fontSize: 14,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 22,
                        child: Text(
                          'Station Taxi',
                          style: TextStyle(
                            color: const Color(0xFF77838F),
                            fontSize: 12,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}