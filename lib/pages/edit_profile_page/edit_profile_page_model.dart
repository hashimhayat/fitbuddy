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

class EditProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for cityField widget.
  TextEditingController? cityFieldController;
  String? Function(BuildContext, String?)? cityFieldControllerValidator;
  // State field(s) for stateField widget.
  TextEditingController? stateFieldController;
  String? Function(BuildContext, String?)? stateFieldControllerValidator;
  // State field(s) for aboutField widget.
  TextEditingController? aboutFieldController;
  String? Function(BuildContext, String?)? aboutFieldControllerValidator;
  // State field(s) for SportsCheckboxGroup widget.
  List<String>? sportsCheckboxGroupValues;
  FormFieldController<List<String>>? sportsCheckboxGroupValueController;
  // State field(s) for ScheduleCheckboxGroup widget.
  List<String>? scheduleCheckboxGroupValues;
  FormFieldController<List<String>>? scheduleCheckboxGroupValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameFieldController?.dispose();
    cityFieldController?.dispose();
    stateFieldController?.dispose();
    aboutFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
