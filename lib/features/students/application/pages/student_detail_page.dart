import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:flutter/material.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Student Detail",
              style: TextStyle().HeadingTextStyle,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                        child: Image.network('https://www.jiomart.com/images/product/original/590000452/sharad-seedless-grapes-1-kg-product-images-o590000452-p590116963-0-202203171004.jpg',
                        fit: BoxFit.contain,
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Lourie Thomas", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("Age : 22", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("pkmuhsin38@gmail.com", style: TextStyle().lightHeadingTextStyle),
                ],
              ),
            ),
            Expanded(
              flex: 1,
                child: Container())
          ],
        ),
      ),
    );
  }
}
