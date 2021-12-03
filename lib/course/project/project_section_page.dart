import 'package:flutter/cupertino.dart';
import 'package:flutter_app_digital_finals/course/models/section_model.dart';
import 'package:flutter_app_digital_finals/course/project/widgets/project_section_box.dart';


//экран отображающий список разделов в проекте
class ProjectSectionPage extends StatelessWidget{
  final List<Section>? sections;

  ProjectSectionPage({
    this.sections
  });

  @override
  Widget build(BuildContext context) {
    if (sections ==  null) return Container(child: Text('Нет разделов'),);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: sections!.length,
        itemBuilder: (ctx, item) {
          int maxItem = sections!.length;

          final bool lastItem = item == maxItem - 1;

          return BoxSection(
            section: sections![item],
            lastItem: lastItem,
          );
        });
  }

}