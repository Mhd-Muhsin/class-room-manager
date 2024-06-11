import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';
import 'package:flutter/material.dart';

class SubjectDetailPage extends StatelessWidget {
  const SubjectDetailPage({super.key, required this.subject});

  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Subject Detail",
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
                        child: Image.network('https://s3-alpha-sig.figma.com/img/4719/2ea2/b386e03e4fa31f4263239265556c76f7?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UKOIGgn1dpZuKKCWmibD56YKh5zxlO8uiFNG35KNcZlnlCVaOn3MM3ZsaIu2sPEsj2lQWZBEHUCmAbQUnPUQPqpYRKnmquI36ajPKGdNIXetA9AU6PI6rj2h6rkaLM30k~hs~jBX3BxHjzJC6Jfr2zkSrvg-BwjfosXdBZ6jhjPN2YszItCelF9fp9D19TsxalGQMccN0pH5fTpyNSbMDQw4fneb5TkDfRshzbohm3XT9LLB7~JZA4XsVUHF2XWdMwPxrRR~wnrIjyk1K1kt-OQv5Paq2EFhwylDSS4-FH8RlQMnS5cIDXwVa0dg6XWF5aLEBn4n67wsx2W890xZWw__',
                          fit: BoxFit.cover,height: double.infinity, width: double.infinity,
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("${subject.name}", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("${subject.teacher}", style: TextStyle().subHeadingTextStyle),
                  SizedBox(height: 08,),
                  Text("Credit : ${subject.credits}", style: TextStyle().lightHeadingTextStyle),
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
