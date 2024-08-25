import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, String>> _meetingHistory = [];

  @override
  void initState() {
    super.initState();
    _loadMeetingHistory();
  }

  Future<void> _loadMeetingHistory() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of meetings from SharedPreferences
    List<String>? meetings = prefs.getStringList('meetings');

    // Debugging log to check the retrieved meetings
    print("Retrieved Meetings from SharedPreferences: $meetings");

    if (meetings != null) {
      setState(() {
        // Convert each meeting query string back to a map
        _meetingHistory = meetings.map((meetingString) {
          return Uri.splitQueryString(meetingString);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call History'),
        backgroundColor: const Color.fromARGB(105, 146, 58, 184),
      ),
      body: _meetingHistory.isEmpty
          ? const Center(child: Text('No call history available'))
          : ListView.builder(
              itemCount: _meetingHistory.length,
              itemBuilder: (context, index) {
                final meeting = _meetingHistory[index];
                return ListTile(
                  title: Text('Meeting Code: ${meeting['code']}'),
                  subtitle: Text(
                      'Start Time: ${meeting['startTime']}\nEnd Time: ${meeting['endTime']}'),
                  trailing: Text('User: ${meeting['userName']}'),
                );
              },
            ),
    );
  }
}
