import 'package:flutter/material.dart';

class TaskProgress extends StatelessWidget {
  const TaskProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff3559C0),
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  tooltip: 'Home',
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: 'profile',
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                  onPressed: () {
                    Icon(Icons.person_outline, color: Color(0xff3559C0));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'assets/images/clock.png',
                  color: Color(0xff3559C0),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'All tasks have been completed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Your tasks will be refreshed soon (40%)',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
