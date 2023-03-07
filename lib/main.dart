import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/router/app_router.dart';
import 'package:project1/screens/Mar6_screen/screen/Image_storage.dart';
import 'package:project1/screens/feb10_screen/widget/PostListView.dart';
import 'package:project1/screens/feb13_screen/widget/post_screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter2_Screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter3_Screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter_Screen.dart';
import 'package:project1/screens/feb15_screen/counter_HomeScreen.dart';
import 'package:project1/screens/feb16_screen/screen/shopping_cart_screen.dart';
import 'package:project1/screens/feb17_screen/screen/iteam_screen.dart';
import 'package:project1/screens/feb20_screen/screen/post_request_demo.dart';
import 'package:project1/screens/feb27_screen/screen/game_details_screen.dart';
import 'package:project1/screens/feb2_screen/login_screen_2Feb.dart';

import 'package:project1/screens/feb2_screen/splash_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:project1/screens/feb6_screen/custom_widget_demo.dart';
import 'package:project1/screens/feb7_screen/animation_demo.dart';
import 'package:project1/screens/feb7_screen/todos_screen.dart';
import 'package:project1/screens/feb8_screen/setState_demo.dart';
import 'package:project1/screens/feb9_screen/Bloc/counter_bloc.dart';
import 'package:project1/screens/feb9_screen/Widget/counter_screen.dart';

import 'screens/feb14_screen/cubit/counter_cubit.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Handling a background message: ${message.messageId}");
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.max,
    ledColor: Colors.red
  );

  const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsIos = DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIos,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if(settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("User granted");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground');
      print('Message data foreground: ${message.data} >>>>>>>> ${message.notification?.body}');

      AndroidNotification? android = message.notification!.android;

      if (message.notification != null && android != null) {
        print('data found;=============>>>>>');
            flutterLocalNotificationsPlugin.show(
                message.notification.hashCode,
                message.notification?.title,
                message.notification?.body,
                NotificationDetails(
                  iOS: DarwinNotificationDetails(
                    presentBadge: true,
                    presentAlert: true,
                    presentSound: true,
                    subtitle: message.notification?.body,
                  ),
                  android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    // channel.description,
                    icon: android.smallIcon,
                    // other properties...
                  ),
                ));
        print('Message also contained a notification: ${message.notification}');
      }
    });
  } else if(settings.authorizationStatus == AuthorizationStatus.provisional){
    print("User granted provisional permission");
  } else {
    print("User denied");
  }
  runApp(const GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? mtoken = "";
  final CounterCubit _counterCubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    setupInteractedMessage();
    super.initState();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
      print('Got a message whilst in the onMessageOpenedApp!');
      print('Message data: ${message.data}');
      print('Message body: ${message.notification?.body}');
      print(">>>>>>>>>>>> ${message.data}");
    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message: message),
    //   );
    // }
  }
  void getToken() async{
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("Token>>>>>>>>> $mtoken");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen2Feb(),
      // onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   '/': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: CounterScreen(),
      //       ),
      //   '/secondCounter': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: Counter2Screen(
      //           color: Colors.red,
      //         ),
      //       ),
      //   '/thirdCounter': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: Counter3Screen(
      //           color: Colors.cyan,
      //         ),
      //       ),
      // },
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: const CounterScreen(),
      // ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class ChatArguments extends StatelessWidget {
  RemoteMessage? message;
  ChatArguments({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: Text(message!.toString(), style: const TextStyle(fontSize: 26.0),),
      ),
    );
  }
}

