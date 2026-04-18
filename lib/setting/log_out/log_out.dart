import 'package:flutter/material.dart';

import '../../features/sign_language/presentation/pages/settingpage.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/splash/presentation/pages/splash_page2.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us" , style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(child: Image.asset('assets/images/Frame 155 (3).png')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text('Are you sure you want to log out?',textAlign: TextAlign.center,
                  style: TextStyle(
               fontWeight: FontWeight.w400,
                    fontSize: 30,)
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text('You will need to login again to access your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,)
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashPage2(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB1747C),
                        minimumSize: Size(double.infinity, 60),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Log out"),
                    ),
                  ),
          
                  SizedBox(width: 10),
          
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Cancel"),
                    ),
                  ),
                ],
              )
              ],
          ),
        ),
      ),
    );
  }
}
