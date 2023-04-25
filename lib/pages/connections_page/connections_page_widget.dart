import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'connections_page_model.dart';
export 'connections_page_model.dart';

class ConnectionsPageWidget extends StatefulWidget {
  const ConnectionsPageWidget({Key? key}) : super(key: key);

  @override
  _ConnectionsPageWidgetState createState() => _ConnectionsPageWidgetState();
}

class _ConnectionsPageWidgetState extends State<ConnectionsPageWidget> {
  late ConnectionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConnectionsPage'});
    _model.searchBarController ??= TextEditingController();
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
        title: 'ConnectionsPage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              automaticallyImplyLeading: false,
              title: Text(
                'Connections',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.searchBarController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search for your shoes...',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0E3E7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF1F4F8),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 20.0, 24.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF57636C),
                              size: 16.0,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF1D2429),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          maxLines: null,
                          validator: _model.searchBarControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.search_sharp,
                          color: Color(0xFF1D2429),
                          size: 30.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF1D2429),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF1D2429),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              labelColor: Color(0xFF4B39EF),
                              unselectedLabelColor: Color(0xFF57636C),
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              elevation: 0.0,
                              tabs: [
                                Tab(
                                  text: 'Connected',
                                ),
                                Tab(
                                  text: 'Pending',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 0.0, 16.0),
                                        child: Text(
                                          'My Matches',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF1D2429),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      PagedListView<DocumentSnapshot<Object?>?,
                                          MatchesRecord>(
                                        pagingController: () {
                                          final Query<Object?> Function(
                                                  Query<Object?>) queryBuilder =
                                              (matchesRecord) => matchesRecord
                                                  .where('matched',
                                                      isEqualTo: true)
                                                  .where('primary_user_ref',
                                                      isEqualTo:
                                                          currentUserReference);
                                          if (_model.pagingController != null) {
                                            final query = queryBuilder(
                                                MatchesRecord.collection);
                                            if (query != _model.pagingQuery) {
                                              // The query has changed
                                              _model.pagingQuery = query;
                                              _model.streamSubscriptions
                                                  .forEach((s) => s?.cancel());
                                              _model.streamSubscriptions
                                                  .clear();
                                              _model.pagingController!
                                                  .refresh();
                                            }
                                            return _model.pagingController!;
                                          }

                                          _model.pagingController =
                                              PagingController(
                                                  firstPageKey: null);
                                          _model.pagingQuery = queryBuilder(
                                              MatchesRecord.collection);
                                          _model.pagingController!
                                              .addPageRequestListener(
                                                  (nextPageMarker) {
                                            queryMatchesRecordPage(
                                              queryBuilder: (matchesRecord) =>
                                                  matchesRecord
                                                      .where('matched',
                                                          isEqualTo: true)
                                                      .where('primary_user_ref',
                                                          isEqualTo:
                                                              currentUserReference),
                                              nextPageMarker: nextPageMarker,
                                              pageSize: 25,
                                              isStream: true,
                                            ).then((page) {
                                              _model.pagingController!
                                                  .appendPage(
                                                page.data,
                                                page.nextPageMarker,
                                              );
                                              final streamSubscription = page
                                                  .dataStream
                                                  ?.listen((data) {
                                                data.forEach((item) {
                                                  final itemIndexes = _model
                                                      .pagingController!
                                                      .itemList!
                                                      .asMap()
                                                      .map((k, v) => MapEntry(
                                                          v.reference.id, k));
                                                  final index = itemIndexes[
                                                      item.reference.id];
                                                  final items = _model
                                                      .pagingController!
                                                      .itemList!;
                                                  if (index != null) {
                                                    items.replaceRange(index,
                                                        index + 1, [item]);
                                                    _model.pagingController!
                                                        .itemList = {
                                                      for (var item in items)
                                                        item.reference: item
                                                    }.values.toList();
                                                  }
                                                });
                                                setState(() {});
                                              });
                                              _model.streamSubscriptions
                                                  .add(streamSubscription);
                                            });
                                          });
                                          return _model.pagingController!;
                                        }(),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                MatchesRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewMatchesRecord = _model
                                                .pagingController!
                                                .itemList![listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF1F4F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewMatchesRecord
                                                              .secondaryUserImage!,
                                                          width: 70.0,
                                                          height: 70.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewMatchesRecord
                                                              .secondaryUserName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF1D2429),
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 0.0, 16.0),
                                        child: Text(
                                          'Categories',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF1D2429),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      StreamBuilder<List<MatchesRecord>>(
                                        stream: queryMatchesRecord(
                                          queryBuilder: (matchesRecord) =>
                                              matchesRecord
                                                  .where('connected',
                                                      isEqualTo: false)
                                                  .where('primary_user_ref',
                                                      isEqualTo:
                                                          currentUserReference),
                                          limit: 50,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<MatchesRecord>
                                              listViewMatchesRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewMatchesRecordList
                                                .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewMatchesRecord =
                                                  listViewMatchesRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF1F4F8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            listViewMatchesRecord
                                                                .secondaryUserImage!,
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewMatchesRecord
                                                                .secondaryUserName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF1D2429),
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
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
        ));
  }
}
