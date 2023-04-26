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
import 'match_page_model.dart';
export 'match_page_model.dart';

class MatchPageWidget extends StatefulWidget {
  const MatchPageWidget({
    Key? key,
    bool? isProfileCompleted,
  })  : this.isProfileCompleted = isProfileCompleted ?? true,
        super(key: key);

  final bool isProfileCompleted;

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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MATCH_PAGE_PAGE_MatchPage_ON_INIT_STATE');
      if ((currentUserDisplayName == '') ||
          (currentUserPhoto == '') ||
          ((currentUserDocument?.sports?.toList() ?? []).length == 0) ||
          (valueOrDefault(currentUserDocument?.about, '') == '') ||
          (valueOrDefault(currentUserDocument?.city, '') == '') ||
          (valueOrDefault(currentUserDocument?.state, '') == '')) {
        logFirebaseEvent('MatchPage_update_app_state');
        FFAppState().update(() {
          FFAppState().isUserProfileComplete = false;
        });
      } else {
        logFirebaseEvent('MatchPage_update_app_state');
        FFAppState().update(() {
          FFAppState().isUserProfileComplete = true;
        });
      }
    });

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
    context.watch<FFAppState>();

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (FFAppState().isUserProfileComplete == false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
                    child: Builder(builder: (_) {
                      final child = Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: DefaultTabController(
                              length: 3,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        KeepAliveWidgetWrapper(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where('email',
                                                        isNotEqualTo:
                                                            currentUserEmail !=
                                                                    ''
                                                                ? currentUserEmail
                                                                : null),
                                                limit: 20,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 60.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    swipeableStackUsersRecordList =
                                                    snapshot.data!;
                                                return FlutterFlowSwipeableStack(
                                                  topCardHeightFraction: 0.72,
                                                  middleCardHeightFraction:
                                                      0.68,
                                                  bottomCardHeightFraction:
                                                      0.75,
                                                  topCardWidthFraction: 0.9,
                                                  middleCardWidthFraction: 0.85,
                                                  bottomCardWidthFraction: 0.8,
                                                  onSwipeFn: (index) {},
                                                  onLeftSwipe: (index) async {
                                                    logFirebaseEvent(
                                                        'MATCH_SwipeableStack_ub6i20nz_ON_LEFT_SW');
                                                    logFirebaseEvent(
                                                        'SwipeableStack_backend_call');

                                                    final matchesCreateData = {
                                                      ...createMatchesRecordData(
                                                        connected: false,
                                                        primaryUserRef:
                                                            currentUserReference,
                                                        secondaryUserRef:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .reference,
                                                        matched: false,
                                                        primaryUserName:
                                                            currentUserDisplayName,
                                                        secondaryUserName:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .displayName,
                                                        prinaryUserImage:
                                                            currentUserPhoto,
                                                        secondaryUserImage:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .photoUrl,
                                                      ),
                                                      'created_at': FieldValue
                                                          .serverTimestamp(),
                                                    };
                                                    await MatchesRecord
                                                        .collection
                                                        .doc()
                                                        .set(matchesCreateData);
                                                  },
                                                  onRightSwipe: (index) async {
                                                    logFirebaseEvent(
                                                        'MATCH_SwipeableStack_ub6i20nz_ON_RIGHT_S');
                                                    logFirebaseEvent(
                                                        'SwipeableStack_backend_call');

                                                    final matchesCreateData = {
                                                      ...createMatchesRecordData(
                                                        connected: false,
                                                        primaryUserRef:
                                                            currentUserReference,
                                                        secondaryUserRef:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .reference,
                                                        matched: true,
                                                        primaryUserName:
                                                            currentUserDisplayName,
                                                        secondaryUserName:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .displayName,
                                                        prinaryUserImage:
                                                            currentUserPhoto,
                                                        secondaryUserImage:
                                                            swipeableStackUsersRecordList[
                                                                    index]!
                                                                .photoUrl,
                                                      ),
                                                      'created_at': FieldValue
                                                          .serverTimestamp(),
                                                    };
                                                    await MatchesRecord
                                                        .collection
                                                        .doc()
                                                        .set(matchesCreateData);
                                                  },
                                                  onUpSwipe: (index) {},
                                                  onDownSwipe: (index) {},
                                                  itemBuilder: (context,
                                                      swipeableStackIndex) {
                                                    final swipeableStackUsersRecord =
                                                        swipeableStackUsersRecordList[
                                                            swipeableStackIndex];
                                                    return Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'MATCH_PAGE_PAGE_mainIMage_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'mainIMage_expand_image');
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            swipeableStackUsersRecord.photoUrl!,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: swipeableStackUsersRecord
                                                                          .photoUrl!,
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag: swipeableStackUsersRecord
                                                                    .photoUrl!,
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        swipeableStackUsersRecord
                                                                            .photoUrl!,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        190.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      swipeableStackUsersRecord
                                                                          .displayName!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            36,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    swipeableStackUsersRecord
                                                                        .city!
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          90,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      swipeableStackUsersRecord
                                                                          .state!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'About',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Just a heads up, there are a few required fields marked with a * that you\'ll need to fill out in order to connect with others. Don\'t worry though, we\'ve made the process as easy and user-friendly as possible.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Activities',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final userSportsList =
                                                                      swipeableStackUsersRecord
                                                                          .sports!
                                                                          .toList();
                                                                  return GridView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    gridDelegate:
                                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          4,
                                                                      crossAxisSpacing:
                                                                          4.0,
                                                                      mainAxisSpacing:
                                                                          4.0,
                                                                      childAspectRatio:
                                                                          1.0,
                                                                    ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        userSportsList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            userSportsListIndex) {
                                                                      final userSportsListItem =
                                                                          userSportsList[
                                                                              userSportsListIndex];
                                                                      return GradientText(
                                                                        userSportsListItem,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        colors: [
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                        ],
                                                                        gradientDirection:
                                                                            GradientDirection.ltr,
                                                                        gradientType:
                                                                            GradientType.linear,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount:
                                                      swipeableStackUsersRecordList
                                                          .length,
                                                  controller: _model
                                                      .swipeableStackController,
                                                  enableSwipeUp: false,
                                                  enableSwipeDown: false,
                                                );
                                              },
                                            ),
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
                          if (FFAppState().isUserProfileComplete == false)
                            Container(
                              width: 10.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                        ],
                      );
                      if (FFAppState().isUserProfileComplete == false) {
                        return ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 2.0,
                              sigmaY: 2.0,
                            ),
                            child: child,
                          ),
                        );
                      }
                      return child;
                    }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
