import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smiley_app/models/check_task_progress.dart';

class CheckTask extends StatefulWidget {
  late final NotificationSetting notificationSetting;

  @override
  State<CheckTask> createState() => _CheckTaskState();
}

class _CheckTaskState extends State<CheckTask> {
  final allowNotifications = NotificationSetting(title: 'Marcar todas');

  final notifications = [
    NotificationSetting(title: 'Objetivo 1'),
    NotificationSetting(title: 'Objetivo 2'),
    NotificationSetting(title: 'Objetivo 3'),
  ];

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 300,
        height: 300,
        child: ListView(
          children: [
            buildToggleCheckbox(allowNotifications),
            const Divider(
              indent: 2,
            ),
            ...notifications.map(buildSingleCheckbox).toList(),
          ],
        ),
      );

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
      notificationSetting: notification,
      onClicked: () {
        final newValue = !notification.value;

        setState(() {
          allowNotifications.value = newValue;
          notifications.forEach((notification) {
            notification.value = newValue;
          });
        });
      });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        notificationSetting: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;

            if (!newValue) {
              allowNotifications.value = false;
            } else {
              final allow =
                  notifications.every((notification) => notification.value);
              allowNotifications.value = allow;
            }
          });
        },
      );

  Widget buildCheckbox({
    required NotificationSetting notificationSetting,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notificationSetting.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notificationSetting.title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
}
