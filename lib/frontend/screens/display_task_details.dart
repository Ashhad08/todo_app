import 'package:flutter/material.dart';

class DisplayTaskDetails extends StatelessWidget {
  final String _title;
  final String _createdDate;
  final String _description;
  final bool _completed;

  const DisplayTaskDetails(
      this._title, this._createdDate, this._description, this._completed,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _createdDate,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  _description,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6)),
                )),
            const SizedBox(
              height: 10,
            ),
            Center(child: _taskStatus(_completed)),
          ],
        ),
      ),
    );
  }

  Widget? _taskStatus(bool status) {
    if (status == true) {
      return const Text(
        "Status : Task Completed",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.green),
      );
    } else {
      return const Text(
        "Status : Task still pending",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red),
      );
    }
  }
}
