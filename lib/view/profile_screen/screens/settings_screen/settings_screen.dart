import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: ColorConstants.bannerColor,
                    child: Icon(Icons.logout)),
                title: Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('LOGOUT!'),
                          content: const Text('Do you want to logout ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false);
                              },
                              child: const Text('YES'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('NO'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                )),
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: ColorConstants.bannerColor,
                    child: Icon(Icons.delete_outline_outlined)),
                title: Text(
                  'Delete Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Delete Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Please let us know the reason why you are leaving ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                      'I dont want to use marketfeed anymore')),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Iam using another account')),
                              TextButton(
                                  onPressed: () {},
                                  child:
                                      Text('Getting too many notifications')),
                              TextButton(
                                  onPressed: () {},
                                  child:
                                      Text('The app is not working properly')),
                              TextButton(onPressed: () {}, child: Text('Other'))
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
