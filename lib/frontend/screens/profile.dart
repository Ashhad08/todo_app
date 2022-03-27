import 'package:flutter/material.dart';
import 'package:todo_app/frontend/dry/profile_tasks_column.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/settings.png',
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Good',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Your regularity rate',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskGeneralProfile(
                          iconImagePath: "assets/images/create.png",
                          iconColor: Color(0xff4d97eb),
                          iconBackgroundColor:
                              Color(0xff4d97eb).withOpacity(0.3),
                          numberOfTasks: 37,
                          caption: "Created tasks"),
                      TaskGeneralProfile(
                          iconImagePath: "assets/images/completed.png",
                          iconColor: Color(0xff05ad70),
                          iconBackgroundColor:
                              Color(0xff05ad70).withOpacity(0.3),
                          numberOfTasks: 24,
                          caption: "Completed tasks"),
                      TaskGeneralProfile(
                          iconImagePath: "assets/images/star.png",
                          iconColor: Color(0xffe0ba12),
                          iconBackgroundColor:
                              Color(0xffe0dd12).withOpacity(0.3),
                          numberOfTasks: 6,
                          caption: "Highest rate"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
              color: Colors.grey.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('FULL NAME',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.grey.withOpacity(0.7),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('E-MAIL',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.grey.withOpacity(0.7),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('DATE OF BIRTH',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.grey.withOpacity(0.7),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nancy Logan',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'nancy.logan@gmail.com',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '22.01.1997',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
