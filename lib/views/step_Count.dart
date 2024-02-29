import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepCountScreen extends StatefulWidget {
  final int stepCount;
  final int goalCount;
  const StepCountScreen(
      {super.key, required this.stepCount, required this.goalCount});

  @override
  State<StepCountScreen> createState() => _StepCountScreenState(
      stepCount: this.stepCount, goalCount: this.goalCount);
}

class _StepCountScreenState extends State<StepCountScreen> {
  final int? stepCount;
  final int? goalCount;
  _StepCountScreenState({this.stepCount, this.goalCount});
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  double? showPercentAge;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    double percentage = (stepCount! / goalCount!).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor3,
        title: const Text(
          'Count Your Daily Steps',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Steps Taken',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              _steps,
              style: const TextStyle(fontSize: 60, color: bgColor3),
            ),
            // const Divider(
            //   height: 100,
            //   thickness: 0,
            //   color: Colors.black,
            // ),
            const Text(
              'Pedestrian Status',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              _status == 'walking'
                  ? Icons.directions_walk
                  : _status == 'stopped'
                      ? Icons.accessibility_new
                      : Icons.error,
              size: 50,
            ),
            Center(
              child: Text(
                _status,
                style: _status == 'walking' || _status == 'stopped'
                    ? const TextStyle(fontSize: 30)
                    : const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CircularPercentIndicator(
              radius: 50,
              animation: true,
              lineWidth: 13.0,
              animationDuration: 5,
              percent: percentage,
              progressColor: bgColor3,
              center: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      FontAwesomeIcons.personWalking,
                      size: 30,
                    ),
                  ),
                  Container(
                    child: Text(
                      _steps,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: bgColor3),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
