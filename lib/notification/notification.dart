
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


  int _counter = 0;

  void sendNotification(String title, String body) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_channel', 'High Importance Notification',
        description: "This channel is for important notification",
        importance: Importance.max);
    flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description)));
  }
