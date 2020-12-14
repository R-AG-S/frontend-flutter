import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payup/utilities/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpPanel extends StatefulWidget {
  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

double _panelHeightOpen;
double _panelHeightClosed;
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class _SlideUpPanelState extends State<SlideUpPanel> {
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    _panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        backdropEnabled: true,
        borderRadius: radius,
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        collapsed: Center(
          child: FaIcon(
            FontAwesomeIcons.chevronUp,
            color: mainTextColor,
          ),
        ),
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        body: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      ),
    );
  }
}
