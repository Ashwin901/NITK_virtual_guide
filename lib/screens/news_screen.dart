import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wec_guide/components/mess_widget.dart';
import 'package:wec_guide/constants.dart';
import 'package:wec_guide/wec_bloc/events.dart';
import 'package:wec_guide/wec_bloc/guide_bloc.dart';
import 'package:wec_guide/components/exit.dart';
import 'package:wec_guide/components/displayWidget.dart';
import 'package:wec_guide/theme_options.dart';
import 'package:wec_guide/wec_bloc/state.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  GuideBloc guideBloc;
  bool switchValue;
  Color indicatorColor,containerColor;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    switchValue = false;
    containerColor = Colors.white;
    indicatorColor = Colors.black87;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    guideBloc = BlocProvider.of(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return onBackPressed(context);
        },
        child: Container(
          color: Colors.white,
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(top: 17),
                      child: Text('theme :',style: textStyle.copyWith(
                        color:indicatorColor
                      ),),
                    ),
                    Switch(
                      activeColor: Colors.black87,
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        var theme;
                        if (Theme.of(context).brightness == Brightness.light) {
                          theme = lightTheme;
                        } else {
                          theme = darkTheme;
                        }
                        guideBloc.add(ChangeThemeEvent(
                            theme: theme));
                      },
                    )
                  ],
                  centerTitle: true,
                  leading: Container(),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height:35,
                        image: AssetImage("images/webclub-logo-orange.png"),
                      ),
                      SizedBox(width: 3.6,),
                      Text("WEC NITK", style: textStyle,)
                    ],
                  ),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: TabBar(
                    indicatorColor: indicatorColor,
                    controller: tabController,
                    tabs: [
                      Tab(
                        text: "news",
                        icon: Icon(
                          Icons.trending_up,
                        ),
                      ),
                      Tab(
                        text: "events",
                        icon: Icon(Icons.event),
                      ),
                      Tab(
                        text: "mess",
                        icon: Icon(Icons.fastfood),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: BlocBuilder<GuideBloc, GuideState>(
              builder: (context, GuideState state) {
                if(state is ChangeThemeState){
                  indicatorColor = state.indicatorColor;
                  containerColor = state.container;
                }
                return Container(
                  color: containerColor,
                  child: Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        itemList(
                            FirebaseFirestore.instance
                                .collection("items")
                                .snapshots(),
                            "news"),
                        itemList(
                            FirebaseFirestore.instance
                                .collection("events")
                                .snapshots(),
                            "event"),
                        messWidget()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    guideBloc.close();
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }


}
