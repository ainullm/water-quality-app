import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyParameterScaleWidget extends StatelessWidget {
  const MyParameterScaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minorTicksPerInterval: 2,
      useRangeColorForAxis: true,
      animateAxis: true,
      interval: 20,
      axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
      ranges: const <LinearGaugeRange>[
        LinearGaugeRange(
            startValue: 0,
            endValue: 33,
            position: LinearElementPosition.outside,
            color: Color(0xffF45656)),
        LinearGaugeRange(
            startValue: 33,
            endValue: 66,
            position: LinearElementPosition.outside,
            color: Color(0xffFFC93E)),
        LinearGaugeRange(
            startValue: 66,
            endValue: 100,
            position: LinearElementPosition.outside,
            color: Color(0xff0DC9AB)),
      ],
    );
  }
}
