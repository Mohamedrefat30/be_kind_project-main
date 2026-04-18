import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset("assets/images/Frame 155.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text("Welcome to our App!", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Text('''Sign Translate is a platform that provides accurate translation of sign language into text or voice,making communication more accessible for the deaf and hard of hearing.''' ,style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 22,
              ),
                textAlign: TextAlign.center,
          
              )
            ],
          ),
        ),
      ),
    );
  }
}
