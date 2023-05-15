import 'package:flutter/material.dart';
import 'package:todo_application/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/shared/styles/app_colors.dart';
import 'package:todo_application/shared/styles/my_theme.dart';

class ShowThemeSheetWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      color: provider.themeMode==ThemeMode.light?lightGreenColor:darkColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Light",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: provider.themeMode!=ThemeMode.light?Colors.grey:Theme.of(context).primaryColor
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: provider.themeMode!=ThemeMode.light?Colors.grey:Theme.of(context).primaryColor,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: provider.themeMode==ThemeMode.light?Colors.black54:Theme.of(context).colorScheme.onBackground,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Dark",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          color:provider.themeMode==ThemeMode.light?Colors.black54:lightColor
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color:provider.themeMode==ThemeMode.light?Colors.black54:lightColor,
                      size: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
