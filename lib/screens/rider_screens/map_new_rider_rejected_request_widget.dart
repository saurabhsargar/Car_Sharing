import 'package:car_sharing/services/map_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget MapNewRiderRejectedRequestWidget(BuildContext context, double heightSize) {
  return Expanded(
      child: Container(
    height: heightSize * 0.25,
    decoration: const BoxDecoration(
        color: Color(0xff199EFF),
        borderRadius: BorderRadius.all(Radius.circular(25))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.cancel_presentation),
        const Text("Requested Rejected! Please try again",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold)),
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? null
                  : Colors.white;
            }),
            backgroundColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? null
                  : Colors.red;
            }),
          ),
          onPressed: () {
            context.read<MapScreenProvider>().setMapHeight(0.70);
            context
                .read<MapScreenProvider>()
                .setCurrentWidgetState("ROUTESCREEN");
          },
          child: const Text("Try again"),
        ),
      ],
    ),
  ));
}
