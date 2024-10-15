// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class CustomSlider extends StatefulWidget {
//   const CustomSlider({super.key});

//   @override
//   State<CustomSlider> createState() => _CustomSliderState();
// }

// class _CustomSliderState extends State<CustomSlider> {
//   double val = 0.30;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.transparent,
//           height: 100,
//           child: CustomPaint(
//             painter: SliderTrackPainter(value: val),
//             child: SliderTheme(
//               data: SliderTheme.of(context).copyWith(
//                 trackHeight: 20, // Hide the default track
//                 thumbShape: CustomSliderThumbShape(), // Custom thumb shape
//                 // trackShape: SliderTrackPainter(value: val),,
//                 thumbColor: Colors.white,
//                 activeTrackColor: Colors.blue,
//                 inactiveTrackColor: Colors.grey,
//                 overlayColor: Colors.transparent,
//               ),
//               child: Slider(
//                 value: val,
//                 onChanged: (value) {
//                   setState(() {
//                     val = value;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SliderTrackPainter extends CustomPainter {
//   final double value;
//   SliderTrackPainter({required this.value});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 3.0
//       ..style = PaintingStyle.stroke;

//     final Paint activePaint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 3.0
//       ..style = PaintingStyle.stroke;

//     final center = Offset(size.width / 2, size.height);
//     final radius = size.width / 1.5;

//     // Drawing the inactive part of the curve
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       math.pi,
//       math.pi,
//       false,
//       paint,
//     );

//     // Drawing the active part of the curve based on slider value
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       math.pi,
//       math.pi * value,
//       false,
//       activePaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class CustomSliderThumbShape extends SliderComponentShape {
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return const Size(12.0, 12.0); // Adjust thumb size
//   }

//   @override
//   void paint(PaintingContext context, Offset center,
//       {required Animation<double> activationAnimation,
//       required Animation<double> enableAnimation,
//       required bool isDiscrete,
//       required TextPainter labelPainter,
//       required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required TextDirection textDirection,
//       required double value,
//       required double textScaleFactor,
//       required Size sizeWithOverflow}) {
//     final radius = parentBox.size.width / 1.5;
//     final centerArc = Offset(parentBox.size.width / 2, parentBox.size.height);
//     final double angle = math.pi * value;

//     // Calculate thumb position on the arc
//     final thumbX = centerArc.dx + radius * math.cos(math.pi + angle);
//     final thumbY = centerArc.dy + radius * math.sin(math.pi + angle);

//     final Paint paint = Paint()
//       ..color = sliderTheme.thumbColor ?? Colors.indigo
//       ..style = PaintingStyle.fill;

//     // Draw the thumb at the calculated position
//     context.canvas.drawCircle(Offset(thumbX, thumbY), 12.0, paint);
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double val = 0.30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.indigoAccent,
          ),
          height: 100,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 20.0, // Hide the default track
              trackShape: CustomSliderTrackShape(), // Custom track shape
              thumbShape: CustomSliderThumbShape(), // Custom thumb shape
              thumbColor: Colors.black,
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              overlayColor: Colors.transparent,
            ),
            child: Slider(
              value: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(12.0, 12.0); // Adjust thumb size
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final radius = parentBox.size.width / 1.5;
    final centerArc = Offset(parentBox.size.width / 2, parentBox.size.height);
    final double angle = math.pi * value;

    // Calculate thumb position on the arc
    final thumbX = centerArc.dx + radius * math.cos(math.pi + angle);
    final thumbY = centerArc.dy + radius * math.sin(math.pi + angle);

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.indigo
      ..style = PaintingStyle.fill;

    // Draw the thumb at the calculated position
    context.canvas.drawCircle(Offset(thumbX, thumbY), 12.0, paint);
  }
}

class CustomSliderTrackShape extends SliderTrackShape {
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset, // Optional parameter
    bool isEnabled = true, // Optional
    bool isDiscrete = false, // Optional
    required TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;

    // Custom paint for the active and inactive parts of the track
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final double radius = parentBox.size.width / 1.5;
    final Offset centerArc =
        Offset(parentBox.size.width / 2, parentBox.size.height);

    // Inactive curve (whole arc)
    canvas.drawArc(
      Rect.fromCircle(center: centerArc, radius: radius),
      math.pi,
      math.pi,
      false,
      inactivePaint,
    );

    // Active curve based on the thumb's position (value is implicitly represented by thumbCenter)
    double activeAngle = thumbCenter.dx / parentBox.size.width * math.pi;
    canvas.drawArc(
      Rect.fromCircle(center: centerArc, radius: radius),
      math.pi,
      activeAngle,
      false,
      activePaint,
    );
  }

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = parentBox.size.width * 0.05;
    final double trackRight = parentBox.size.width * 0.95;
    final double trackTop = (parentBox.size.height - trackHeight) / 2;
    final double trackBottom = trackTop + trackHeight;

    return Rect.fromLTRB(trackLeft, trackTop, trackRight, trackBottom);
  }
}
