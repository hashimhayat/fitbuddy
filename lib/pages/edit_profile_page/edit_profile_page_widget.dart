import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_page_model.dart';
export 'edit_profile_page_model.dart';

class EditProfilePageWidget extends StatefulWidget {
  const EditProfilePageWidget({Key? key}) : super(key: key);

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  late EditProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditProfilePage'});
    _model.nameFieldController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.cityFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.city, ''));
    _model.stateFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.state, ''));
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
        title: 'EditProfilePage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('EDIT_PROFILE_arrow_back_rounded_ICN_ON_T');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                  if ((currentUserDisplayName == '') ||
                      (currentUserPhoto == '') ||
                      ((currentUserDocument?.sports?.toList() ?? []).length ==
                          0)) {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().update(() {
                      FFAppState().isUserProfileComplete = false;
                    });
                  } else {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().update(() {
                      FFAppState().isUserProfileComplete = true;
                    });
                  }
                },
              ),
              title: Text(
                'Build your profile',
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
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 8.0, 2.0, 16.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE_Image_wgqfyn14_ON_TAP');
                                  logFirebaseEvent(
                                      'Image_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 400.00,
                                    maxHeight: 400.00,
                                    imageQuality: 100,
                                    allowPhoto: true,
                                    includeDimensions: true,
                                    includeBlurHash: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('Image_backend_call');

                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80.0),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                                    ),
                                    width: 88.0,
                                    height: 88.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: _model.nameFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.nameFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'EDIT_PROFILE_nameField_ON_TEXTFIELD_CHAN');
                                        logFirebaseEvent(
                                            'nameField_backend_call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          displayName:
                                              _model.nameFieldController.text,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'EDIT_PROFILE_nameField_ON_TEXTFIELD_SUBM');
                                      logFirebaseEvent(
                                          'nameField_backend_call');

                                      final usersUpdateData =
                                          createUsersRecordData(
                                        displayName:
                                            _model.nameFieldController.text,
                                      );
                                      await currentUserReference!
                                          .update(usersUpdateData);
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .nameFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'City',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.cityFieldController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.cityFieldController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'EDIT_PROFILE_cityField_ON_TEXTFIELD_CHAN');
                                          logFirebaseEvent(
                                              'cityField_backend_call');

                                          final usersUpdateData =
                                              createUsersRecordData(
                                            city:
                                                _model.cityFieldController.text,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'EDIT_PROFILE_cityField_ON_TEXTFIELD_SUBM');
                                        logFirebaseEvent(
                                            'cityField_backend_call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          city: _model.cityFieldController.text,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .cityFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.stateFieldController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.stateFieldController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'EDIT_PROFILE_stateField_ON_TEXTFIELD_CHA');
                                          logFirebaseEvent(
                                              'stateField_backend_call');

                                          final usersUpdateData =
                                              createUsersRecordData(
                                            state: _model
                                                .stateFieldController.text,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'EDIT_PROFILE_stateField_ON_TEXTFIELD_SUB');
                                        logFirebaseEvent(
                                            'stateField_backend_call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          state:
                                              _model.stateFieldController.text,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .stateFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'What sports do you play?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowCheckboxGroup(
                                      options: [
                                        'Tennis',
                                        'Gym',
                                        'Football',
                                        'Basketball'
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .sportsCheckboxGroupValues = val);
                                        logFirebaseEvent(
                                            'EDIT_PROFILE_SportsCheckboxGroup_ON_FORM');
                                        logFirebaseEvent(
                                            'SportsCheckboxGroup_backend_call');

                                        final usersUpdateData = {
                                          'sports':
                                              _model.sportsCheckboxGroupValues,
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                      },
                                      controller: _model
                                              .sportsCheckboxGroupValueController ??=
                                          FormFieldController<List<String>>(
                                        (currentUserDocument?.sports
                                                ?.toList() ??
                                            []),
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      checkColor: Colors.white,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 0.0, 0.0),
                                      checkboxBorderRadius:
                                          BorderRadius.circular(8.0),
                                      initialized:
                                          _model.sportsCheckboxGroupValues !=
                                              null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'How often do you play?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowCheckboxGroup(
                                      options: [
                                        'Daily',
                                        'Weekly',
                                        'Monthly',
                                        'I do not play regularly'
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .scheduleCheckboxGroupValues = val),
                                      controller: _model
                                              .scheduleCheckboxGroupValueController ??=
                                          FormFieldController<List<String>>(
                                        (currentUserDocument?.playingSchedule
                                                ?.toList() ??
                                            []),
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      checkColor: Colors.white,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 0.0, 0.0),
                                      checkboxBorderRadius:
                                          BorderRadius.circular(8.0),
                                      initialized:
                                          _model.scheduleCheckboxGroupValues !=
                                              null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_PAGE_PAGE_SUBMIT_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_back');
                                context.safePop();
                                if ((currentUserDisplayName == '') ||
                                    (currentUserPhoto == '') ||
                                    ((currentUserDocument?.sports?.toList() ??
                                                [])
                                            .length ==
                                        0)) {
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().isUserProfileComplete = false;
                                  });
                                } else {
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().isUserProfileComplete = true;
                                  });
                                }
                              },
                              text: 'Submit',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
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
        ));
  }
}
