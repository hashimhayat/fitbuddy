import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/profle_completion_status_card/profle_completion_status_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'match_page_model.dart';
export 'match_page_model.dart';

class MatchPageWidget extends StatefulWidget {
  const MatchPageWidget({Key? key}) : super(key: key);

  @override
  _MatchPageWidgetState createState() => _MatchPageWidgetState();
}

class _MatchPageWidgetState extends State<MatchPageWidget> {
  late MatchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MatchPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'MatchPage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              automaticallyImplyLeading: false,
              title: Text(
                'Match',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('MATCH_Container_qlshx0b5_ON_TAP');
                        logFirebaseEvent(
                            'profleCompletionStatusCard_navigate_to');

                        context.pushNamed('EditProfilePage');
                      },
                      child: wrapWithModel(
                        model: _model.profleCompletionStatusCardModel,
                        updateCallback: () => setState(() {}),
                        child: ProfleCompletionStatusCardWidget(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              tabs: [
                                Tab(
                                  text: 'Individuals',
                                ),
                                Tab(
                                  text: 'Groups',
                                ),
                                Tab(
                                  text: 'Trainers',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) =>
                                        FlutterFlowSwipeableStack(
                                      topCardHeightFraction: 0.72,
                                      middleCardHeightFraction: 0.68,
                                      bottomCardHeightFraction: 0.75,
                                      topCardWidthFraction: 0.9,
                                      middleCardWidthFraction: 0.85,
                                      bottomCardWidthFraction: 0.8,
                                      onSwipeFn: (index) {},
                                      onLeftSwipe: (index) {},
                                      onRightSwipe: (index) {},
                                      onUpSwipe: (index) {},
                                      onDownSwipe: (index) {},
                                      itemBuilder: (context, index) {
                                        return [][index]();
                                      },
                                      itemCount: 0,
                                      controller:
                                          _model.swipeableStackController,
                                      enableSwipeUp: false,
                                      enableSwipeDown: false,
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Text(
                                      'Tab View 2',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32.0,
                                          ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Text(
                                      'Tab View 3',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
