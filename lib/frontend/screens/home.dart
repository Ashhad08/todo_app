import 'package:flutter/material.dart';
import 'package:todo_app/frontend/model_classes/check_list_model.dart';
import '../model_classes/task_model_list_tile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CheckListModel> categoryContainer = [
    CheckListModel(
        iconImagePath: 'assets/images/enviroment.png',
        iconColor: Color(0xff05ad70),
        iconBackgroundColor: Color(0xff05ad70).withOpacity(0.3),
        category: 'Environment',
        numberOfTasks: '3 Tasks'),
    CheckListModel(
        iconImagePath: 'assets/images/elrecity.png',
        iconColor: Color(0xffe0ba12),
        iconBackgroundColor: Color(0xffe0dd12).withOpacity(0.3),
        category: 'Electricity',
        numberOfTasks: '3 Tasks'),
    CheckListModel(
        iconImagePath: 'assets/images/pets.png',
        iconColor: Color(0xff069494),
        iconBackgroundColor: Color(0xff069494).withOpacity(0.3),
        category: 'Pets',
        numberOfTasks: '2 Tasks'),
    CheckListModel(
        iconImagePath: 'assets/images/uni.png',
        iconColor: Color(0xff0859a1),
        iconBackgroundColor: Color(0xff0859a1).withOpacity(0.3),
        category: 'University',
        numberOfTasks: '4 Tasks'),
    CheckListModel(
        iconImagePath: 'assets/images/class.png',
        iconColor: Color(0xff097f99),
        iconBackgroundColor: Color(0xff097f99).withOpacity(0.3),
        category: 'Class',
        numberOfTasks: '6 Tasks'),
  ];

  List<TasksListTileModel> taskListTile = [
    TasksListTileModel(
        iconImagePath: 'assets/images/profile.png',
        iconColor: Color(0xff0859a1),
        iconBackgroundColor: Color(0xff0859a1).withOpacity(0.3),
        title: 'Water the flowers',
        subTitle: 'It\'s important to take care of nature'),
    TasksListTileModel(
        iconImagePath: 'assets/images/elrecity.png',
        iconColor: Color(0xffe0ba12),
        iconBackgroundColor: Color(0xffe0dd12).withOpacity(0.3),
        title: 'Turn heating off',
        subTitle: 'By turning heat of you can avoid....'),
    TasksListTileModel(
        iconImagePath: 'assets/images/pets.png',
        iconColor: Color(0xff069494),
        iconBackgroundColor: Color(0xff069494).withOpacity(0.3),
        title: 'Feed an animal',
        subTitle: 'Take care of your lovely pet'),
    TasksListTileModel(
        iconImagePath: 'assets/images/enviroment.png',
        iconColor: Color(0xff05ad70),
        iconBackgroundColor: Color(0xff05ad70).withOpacity(0.3),
        title: 'Food container',
        subTitle: 'By taking your food container...'),
    TasksListTileModel(
        iconImagePath: 'assets/images/elrecity.png',
        iconColor: Color(0xffe0ba12),
        iconBackgroundColor: Color(0xffe0dd12).withOpacity(0.3),
        title: 'Switch the lights off',
        subTitle: 'it help you to save your money'),
    TasksListTileModel(
        iconImagePath: 'assets/images/class.png',
        iconColor: Color(0xff097f99),
        iconBackgroundColor: Color(0xff097f99).withOpacity(0.3),
        title: 'Complete the assignment',
        subTitle: 'it help you to take good marks'),
    TasksListTileModel(
        iconImagePath: 'assets/images/uni.png',
        iconColor: Color(0xff0859a1),
        iconBackgroundColor: Color(0xff0859a1).withOpacity(0.3),
        title: 'Join the business seminar ',
        subTitle: 'Gives you good Exposure'),
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUICK CHECKLIST',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: categoryContainer.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          context,
                          i,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 15, top: 10, bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: -30,
                                      blurRadius: 20,
                                      offset: Offset(30, 35),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: -30,
                                      blurRadius: 20,
                                      offset: Offset(-20, 35),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: -30,
                                      blurRadius: 20,
                                      offset: Offset(40, -20),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 15, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundColor: categoryContainer[i]
                                          .iconBackgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          categoryContainer[i].iconImagePath,
                                          color: categoryContainer[i].iconColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      categoryContainer[i].category,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      categoryContainer[i].numberOfTasks,
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(0.6),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'YOUR TASKS',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 3),
                          child: Text(
                            '8',
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.46,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: taskListTile.length,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 22,
                                backgroundColor:
                                    taskListTile[i].iconBackgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    taskListTile[i].iconImagePath,
                                    color: taskListTile[i].iconColor,
                                  ),
                                ),
                              ),
                              title: Text(
                                taskListTile[i].title,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                taskListTile[i].subTitle,
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
