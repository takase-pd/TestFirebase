import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<StationsRecord>>(
              stream: queryStationsRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<StationsRecord> listTileStationsRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  listTileStationsRecordList =
                      createDummyStationsRecord(count: 1);
                }
                final listTileStationsRecord = listTileStationsRecordList.first;
                return ListTile(
                  title: Text(
                    listTileStationsRecord.name,
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor...',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
