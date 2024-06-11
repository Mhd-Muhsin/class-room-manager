import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';
import 'package:flutter/material.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({super.key, required this.student});

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Student Detail",
              style: TextStyle().headingTextStyle,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(
                        child: Image.network('https://s3-alpha-sig.figma.com/img/b2f8/5a15/72798cb44060aabf071b4f7c3b70e58f?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Kyjs-1L51Ldt9nI4~CECLH6mYO8wBRcM00PeRdVrDQGMddkZTAN0~j4P7P4uArnNwRjewLLfaqGaFQ4EI5pxYEsFSpa1Qn89mMwTRdBSEbi0esi~YClOT46Bu2ksa7B3zc0LvF-POnjNFZyZBhtxKLvukY~goUkdv~90vm8o68OA6-2Zz9FtuZl3GVBo6tgrOfoImfq-u3elav3WxW0OczwRhnh-A68~hRfA7oj6VVRJTJjX4OqtKVExJuZbTlTrpl0ztYsGTE4ayN5gRu-JywYSeGL6Z-0cSQRzqsexomwwrQP8FcYCZ4yStPgZBa1XDP4~RW1Krqy8N2EggMbuHA__',
                          fit: BoxFit.cover,height: double.infinity, width: double.infinity,
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("${student.name}", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("Age : ${student.age}", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("${student.email}", style: TextStyle().lightHeadingTextStyle),
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
