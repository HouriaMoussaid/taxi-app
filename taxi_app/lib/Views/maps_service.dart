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
                        left: 132,
                        top: 52,
                        child: Text(
                          'Nearest ATM',
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
                left: 0,
                top: 476,
                child: Container(
                  width: 375,
                  height: 336,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 375,
                          height: 336,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 158,
                        top: 12,
                        child: Container(
                          width: 59,
                          height: 7,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFCECBD4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 50,
                        child: Text(
                          'Nearest ATM',
                          style: TextStyle(
                            color: const Color(0xFF1E2022),
                            fontSize: 14,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 88,
                        child: Container(
                          width: 347,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF6938D3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 105,
                        top: 98,
                        child: Container(
                          width: 241,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Blue Green ATM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 24,
                                child: Text(
                                  'Arrival 10:30',
                                  style: TextStyle(
                                    color: const Color(0xFFD8CAF7),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 198,
                                top: 12,
                                child: Text(
                                  '6 min',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: const Color(0xFFD8CAF7),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 158,
                        child: Container(
                          width: 347,
                          height: 60,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF6938D3),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 105,
                        top: 168,
                        child: Container(
                          width: 241,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Morose ATM',
                                  style: TextStyle(
                                    color: const Color(0xFF1E2022),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 24,
                                child: Text(
                                  'Arrival 10:35',
                                  style: TextStyle(
                                    color: const Color(0xFF77838F),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 191,
                                top: 12,
                                child: Text(
                                  '12 min',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: const Color(0xFF77838F),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 228,
                        child: Container(
                          width: 347,
                          height: 60,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF6938D3),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 105,
                        top: 238,
                        child: Container(
                          width: 241,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Norman ATM',
                                  style: TextStyle(
                                    color: const Color(0xFF1E2022),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 24,
                                child: Text(
                                  'Arrival 10:35',
                                  style: TextStyle(
                                    color: const Color(0xFF77838F),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 190,
                                top: 12,
                                child: Text(
                                  '14 min',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: const Color(0xFF77838F),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 207,
                        child: Container(
                          width: 375,
                          height: 129,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, 0.00),
                              end: Alignment(0.00, 1.00),
                              colors: [Colors.white.withValues(alpha: 0.75), Colors.white],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 254,
                        child: Container(
                          width: 347,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 347,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF6938D3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 134,
                                top: 17,
                                child: Text(
                                  'Book Now',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}