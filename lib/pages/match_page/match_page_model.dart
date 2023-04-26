import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/profle_completion_status_card/profle_completion_status_card_widget.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class MatchPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for profleCompletionStatusCard component.
  late ProfleCompletionStatusCardModel profleCompletionStatusCardModel;
  // State field(s) for SwipeableStack widget.
  late SwipeableCardSectionController swipeableStackController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profleCompletionStatusCardModel =
        createModel(context, () => ProfleCompletionStatusCardModel());
    swipeableStackController = SwipeableCardSectionController();
  }

  void dispose() {
    profleCompletionStatusCardModel.dispose();
  }

  /// Additional helper methods are added here.

}
