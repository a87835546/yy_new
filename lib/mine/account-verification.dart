
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineVerificationWidget extends StatefulWidget {
  const MineVerificationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineVerificationState();
}

class _MineVerificationState extends State<MineVerificationWidget> {
  bool is_fully_verified = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(250.0, 0.0),
              child: SizedBox(
                width: 85.0,
                height: 61.0,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(22.0, 0.0),
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: getAccountStatusWidget(),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, 51.0),
                      child: const SizedBox(
                        width: 85.0,
                        height: 10.0,
                        child: Text(
                          'FULLY VERIFIED',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 8,
                            color: Color(0xffd4d4d4),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(125.0, 1.0),
              child: SizedBox(
                width: 85.0,
                height: 60.0,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(22.0, 0.0),
                      child: SizedBox(
                        width: 40.0,
                        height: 45.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: const Color(0xffffcc5a),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                border: Border.all(
                                    width: 5.0, color: const Color(0xfff4f4f4)),
                              ),
                            ),

                            Transform.translate(
                              offset: Offset(23.0, 29.0),
                              child: SizedBox(
                                width: 16.0,
                                height: 16.0,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        border: Border.all(
                                            width: 2.0,
                                            color: const Color(0xffffffff)),
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
                    Transform.translate(
                      offset: Offset(0.0, 50.0),
                      child: const SizedBox(
                        width: 85.0,
                        height: 10.0,
                        child: Text(
                          'CONFIRM IDENTITY',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 8,
                            color: Color(0xffd4d4d4),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )

// Widgets

        );
  }

  Widget getAccountStatusWidget() {
    // check if user is fully verified
      return Stack(
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius:
                  const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 5.0, color: const Color(0xff75be00)),
            ),
          ),
        ],
      );

  }
}
