import 'package:be_kind_project/setting/rate_us/stars.dart';
import 'package:flutter/material.dart';

class RateUs extends StatelessWidget {
  const RateUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rate Us" , style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(child: Image.asset('assets/images/Frame 155 (1).png')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Text("How was your experience?", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),),
              RatingWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Write a review",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB1747C),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );

  }
}
