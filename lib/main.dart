import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/shared/bloc_observer.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';
import 'package:untitled1/shared/networks/local/cache_helper.dart';
import 'package:untitled1/shared/networks/remote/duo_helper.dart';


import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/Counter_Screen.dart';
import 'modules/login/Login_Screen.dart';
import 'modules/testing/validation.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getdata(key: 'isDark');

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget
{
  final bool isDark;

  MyApp(this.isDark);

@override
  Widget build(BuildContext context)
  {
return MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => NewCubit()..getbusiness()..getsports()..getscience()),
    BlocProvider(create: (context) => AppCubit()..changeAppMode(

      fromShared: isDark,

    ),
    ),
  ],
  child:   BlocConsumer<AppCubit,AppStates>(

    listener: (context,state){},

    builder: (context,state){

      return MaterialApp(



        debugShowCheckedModeBanner: false,



        theme: ThemeData(



          primarySwatch: Colors.deepOrange,



          scaffoldBackgroundColor: Colors.white,



          appBarTheme: AppBarTheme(



            titleSpacing: 20.0,



            backwardsCompatibility: false ,



            backgroundColor: Colors.white,



            elevation: 0.0,



            titleTextStyle: TextStyle(



                color: Colors.black,



                fontSize: 20.0,



                fontWeight: FontWeight.bold



            ),



            iconTheme: IconThemeData(



              color: Colors.black,



            ),



            systemOverlayStyle: SystemUiOverlayStyle(



                statusBarColor: Colors.white



            ),



          ),



          floatingActionButtonTheme: FloatingActionButtonThemeData(



              backgroundColor: Colors.deepOrange



          ),



          bottomNavigationBarTheme: BottomNavigationBarThemeData(



            type: BottomNavigationBarType.fixed,



            selectedItemColor: Colors.deepOrange,



            unselectedItemColor:  Colors.grey,



            backgroundColor: Colors.white,



          ),



          textTheme: TextTheme(



            bodyText1: TextStyle(



                fontSize: 18.0,



                fontWeight: FontWeight.w600,



                color: Colors.black



            ),



          ),



        ),



        darkTheme: ThemeData(



            primarySwatch: Colors.deepOrange,



            scaffoldBackgroundColor: HexColor('333739'),



            appBarTheme: AppBarTheme(



              titleSpacing: 20.0,



              backwardsCompatibility: false ,



              backgroundColor:HexColor('333739'),



              elevation: 0.0,



              titleTextStyle: TextStyle(



                  color: Colors.white,



                  fontSize: 20.0,



                  fontWeight: FontWeight.bold



              ),



              iconTheme: IconThemeData(



                color: Colors.white,



              ),



              systemOverlayStyle: SystemUiOverlayStyle(



                statusBarColor: HexColor('333739'),



                statusBarIconBrightness: Brightness.light,



              ),



            ),



            floatingActionButtonTheme: FloatingActionButtonThemeData(



                backgroundColor: Colors.deepOrange



            ),



            bottomNavigationBarTheme: BottomNavigationBarThemeData(



              type: BottomNavigationBarType.fixed,



              selectedItemColor: Colors.deepOrange,



              unselectedItemColor:  Colors.grey,



              backgroundColor: HexColor('333739'),







            ),



            textTheme: TextTheme(



              bodyText1: TextStyle(



                fontSize: 18.0,



                fontWeight: FontWeight.w600,



                color: Colors.white,



              ),



            )



        ),



        themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,



        home: Directionality(



            textDirection: TextDirection.rtl,



            child: NewsLayout()



        ),











      );

    },
  
  ),
);
  }
}