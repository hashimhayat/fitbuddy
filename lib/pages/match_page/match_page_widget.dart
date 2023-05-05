import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/empty_list_widget/empty_list_widget_widget.dart';
import '/widgets/profle_completion_status_card/profle_completion_status_card_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
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
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (FFAppState().isUserProfileComplete == false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 16.0, 8.0, 4.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MATCH_Container_qlshx0b5_ON_TAP');
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
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder: (usersRecord) =>
                                                            usersRecord.where(
                                                                'email',
                                                                isNotEqualTo:
                                                                    currentUserEmail !=
                                                                            ''
                                                                        ? currentUserEmail
                                                                        : null),
                                                        limit: 20,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: FlutterFlowTheme.of(
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
                                                        if (swipeableStackUsersRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.9,
                                                              height: 300.0,
                                                              child:
                                                                  EmptyListWidgetWidget(),
                                                            ),
                                                          );
                                                        }
                                                        return FlutterFlowSwipeableStack(
                                                          topCardHeightFraction:
                                                              0.72,
                                                          middleCardHeightFraction:
                                                              0.68,
                                                          bottomCardHeightFraction:
                                                              0.75,
                                                          topCardWidthFraction:
                                                              0.9,
                                                          middleCardWidthFraction:
                                                              0.85,
                                                          bottomCardWidthFraction:
                                                              0.8,
                                                          onSwipeFn: (index) {},
                                                          onLeftSwipe:
                                                              (index) async {
                                                            logFirebaseEvent(
                                                                'MATCH_SwipeableStack_ub6i20nz_ON_LEFT_SW');
                                                            logFirebaseEvent(
                                                                'SwipeableStack_backend_call');

                                                            final matchesCreateData =
                                                                {
                                                              ...createMatchesRecordData(
                                                                connected:
                                                                    false,
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
                                                              'created_at':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            };
                                                            await MatchesRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    matchesCreateData);
                                                          },
                                                          onRightSwipe:
                                                              (index) async {
                                                            logFirebaseEvent(
                                                                'MATCH_SwipeableStack_ub6i20nz_ON_RIGHT_S');
                                                            logFirebaseEvent(
                                                                'SwipeableStack_backend_call');

                                                            final matchesCreateData =
                                                                {
                                                              ...createMatchesRecordData(
                                                                connected:
                                                                    false,
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
                                                              'created_at':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            };
                                                            await MatchesRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    matchesCreateData);
                                                          },
                                                          onUpSwipe: (index) {},
                                                          onDownSwipe:
                                                              (index) {},
                                                          itemBuilder: (context,
                                                              swipeableStackIndex) {
                                                            final swipeableStackUsersRecord =
                                                                swipeableStackUsersRecordList[
                                                                    swipeableStackIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          8.0,
                                                                          4.0,
                                                                          8.0),
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 10.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MATCH_PAGE_PAGE_mainIMage_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'mainIMage_expand_image');
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            PageTransition(
                                                                              type: PageTransitionType.fade,
                                                                              child: FlutterFlowExpandedImageView(
                                                                                image: CachedNetworkImage(
                                                                                  imageUrl: swipeableStackUsersRecord.photoUrl!,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                                allowRotation: false,
                                                                                tag: swipeableStackUsersRecord.photoUrl!,
                                                                                useHeroAnimation: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Hero(
                                                                          tag: swipeableStackUsersRecord
                                                                              .photoUrl!,
                                                                          transitionOnUserGestures:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: swipeableStackUsersRecord.photoUrl!,
                                                                              width: double.infinity,
                                                                              height: 190.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            12.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                swipeableStackUsersRecord.displayName!.maybeHandleOverflow(
                                                                                  maxChars: 36,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 20.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              swipeableStackUsersRecord.city!.maybeHandleOverflow(
                                                                                maxChars: 90,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                swipeableStackUsersRecord.state!,
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          'About',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          swipeableStackUsersRecord
                                                                              .about!,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          'Activities',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final userSportsList =
                                                                                swipeableStackUsersRecord.sports!.toList();
                                                                            return GridView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 4,
                                                                                crossAxisSpacing: 8.0,
                                                                                mainAxisSpacing: 8.0,
                                                                                childAspectRatio: 1.0,
                                                                              ),
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: userSportsList.length,
                                                                              itemBuilder: (context, userSportsListIndex) {
                                                                                final userSportsListItem = userSportsList[userSportsListIndex];
                                                                                return GradientText(
                                                                                  userSportsListItem,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                    FlutterFlowTheme.of(context).secondary
                                                                                  ],
                                                                                  gradientDirection: GradientDirection.ltr,
                                                                                  gradientType: GradientType.linear,
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                          enableSwipeDown:
                                                              false,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<WaitlistRecord>>(
                                                    stream: queryWaitlistRecord(
                                                      queryBuilder: (waitlistRecord) =>
                                                          waitlistRecord
                                                              .where('email',
                                                                  isEqualTo:
                                                                      currentUserEmail)
                                                              .where('type',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'groups',
                                                                    'groups',
                                                                  )),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<WaitlistRecord>
                                                          columnWaitlistRecordList =
                                                          snapshot.data!;
                                                      final columnWaitlistRecord =
                                                          columnWaitlistRecordList
                                                                  .isNotEmpty
                                                              ? columnWaitlistRecordList
                                                                  .first
                                                              : null;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: Text(
                                                              'Coming Soon 🎉',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Join the waitlist to be notified when the group matching feature is available.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (!(columnWaitlistRecord !=
                                                              null))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          28.0,
                                                                          0.0,
                                                                          28.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MATCH_JOIN_THE_WAITLIST_BTN_ON_TAP');
                                                                  if ((columnWaitlistRecord !=
                                                                          null) ==
                                                                      false) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    final waitlistCreateData =
                                                                        {
                                                                      ...createWaitlistRecordData(
                                                                        email:
                                                                            currentUserEmail,
                                                                        type:
                                                                            'groups',
                                                                      ),
                                                                      'joined_on':
                                                                          FieldValue
                                                                              .serverTimestamp(),
                                                                    };
                                                                    await WaitlistRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            waitlistCreateData);
                                                                  } else {
                                                                    return;
                                                                  }
                                                                },
                                                                text:
                                                                    'Join the waitlist',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          24.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          if (columnWaitlistRecord !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                'You have already joined the waitlist!',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge,
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<WaitlistRecord>>(
                                                    stream: queryWaitlistRecord(
                                                      queryBuilder: (waitlistRecord) =>
                                                          waitlistRecord
                                                              .where('email',
                                                                  isEqualTo:
                                                                      currentUserEmail)
                                                              .where('type',
                                                                  isEqualTo:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    'trainers',
                                                                    'trainers',
                                                                  )),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<WaitlistRecord>
                                                          columnWaitlistRecordList =
                                                          snapshot.data!;
                                                      final columnWaitlistRecord =
                                                          columnWaitlistRecordList
                                                                  .isNotEmpty
                                                              ? columnWaitlistRecordList
                                                                  .first
                                                              : null;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: Text(
                                                              'Coming Soon 🎉',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Join the waitlist to be notified when the trainer matching feature is available.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (!(columnWaitlistRecord !=
                                                              null))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          28.0,
                                                                          0.0,
                                                                          28.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MATCH_JOIN_THE_WAITLIST_BTN_ON_TAP');
                                                                  if ((columnWaitlistRecord !=
                                                                          null) ==
                                                                      false) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    final waitlistCreateData =
                                                                        {
                                                                      ...createWaitlistRecordData(
                                                                        email:
                                                                            currentUserEmail,
                                                                        type:
                                                                            'trainers',
                                                                      ),
                                                                      'joined_on':
                                                                          FieldValue
                                                                              .serverTimestamp(),
                                                                    };
                                                                    await WaitlistRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            waitlistCreateData);
                                                                  } else {
                                                                    return;
                                                                  }
                                                                },
                                                                text:
                                                                    'Join the waitlist',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          24.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          if (columnWaitlistRecord !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                'You have already joined the waitlist!',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge,
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().isUserProfileComplete ==
                                      false)
                                    Container(
                                      width: double.infinity,
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).tertiary,
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 400.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x2E000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFF1F4F8),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 4.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Color(0xFF4B39EF),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'UserName',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Overall',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Text(
                                                        '5',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color: Color(
                                                                  0xFF101213),
                                                              fontSize: 24.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color: Color(0xFF4B39EF),
                                                      size: 20.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: AutoSizeText(
                                                'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
