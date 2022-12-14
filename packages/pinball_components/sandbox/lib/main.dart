import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/stories/stories.dart';

void main() {
  final dashbook = Dashbook(theme: ThemeData.light());

  addBallStories(dashbook);
  addLayerStories(dashbook);
  addEffectsStories(dashbook);
  addErrorComponentStories(dashbook);
  addFlutterForestStories(dashbook);
  addInspiScorchStories(dashbook);
  addAndroidAcresStories(dashbook);
  addJurteAreaStories(dashbook);
  addBottomGroupStories(dashbook);
  addPlungerStories(dashbook);
  addBoundariesStories(dashbook);
  addGoogleWordStories(dashbook);
  addLaunchRampStories(dashbook);
  addScoreStories(dashbook);
  addMultiballStories(dashbook);
  addMultipliersStories(dashbook);
  addArrowIconStories(dashbook);

  runApp(dashbook);
}
