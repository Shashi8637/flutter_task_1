import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_1/api.services.dart';
import 'package:flutter_task_1/widgets/learning_options.widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../list.contents.dart';
import '../widgets/events_cards.widget.dart';
import '../widgets/lesson_cards.widget.dart';
import '../widgets/program_cards.widget.dart';

List<BottomNavigationBarItem> _navItems = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets_svg/home_icon.svg'),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets_svg/learn_outlined_icon.svg'),
    label: 'Learn',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets_svg/hub_icon.svg'),
    label: 'Hub',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets_svg/chat_icon.svg'),
    label: 'Chat',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets_svg/profile_icon.svg',
      height: 14.h,
      width: 14.w,
    ),
    label: 'Profile',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 36.w,
        toolbarHeight: 56,
        elevation: 0,
        backgroundColor: const Color(0xFFEEF3FD),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets_svg/drawer_icon.svg',
              height: 24.h,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets_svg/message_icon.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
          SizedBox(
            width: 20.42.w,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets_svg/notification_icon.svg',
              height: 22.h,
              width: 22.w,
            ),
          ),
          const SizedBox(
            width: 18.42,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220.h,
              width: double.infinity,
              color: const Color(0xFFEEF3FD),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Hello, Priya!',
                      style: GoogleFonts.lora(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF08090A)),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      'What do you wanna learn today?',
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6D747A)),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LearningOptionTabs(
                                svgAsset: 'assets_svg/program_icon.svg',
                                courseName: 'Programs'),
                            LearningOptionTabs(
                                svgAsset: 'assets_svg/getHelp_icon.svg',
                                courseName: 'Get help'),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LearningOptionTabs(
                                svgAsset: 'assets_svg/learn_icon.svg',
                                courseName: 'Learn'),
                            LearningOptionTabs(
                                svgAsset: 'assets_svg/tracker_icon.svg',
                                courseName: 'DD Tracker'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Programs for you',
                        style: GoogleFonts.lora(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: const Color(0xFF6D747A)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SvgPicture.asset(
                              'assets_svg/rightArrow_icon.svg',
                              height: 9.5.h,
                              width: 13.w,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  FutureBuilder(
                      future: ApiServices().getProgramData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading');
                        } else {
                          if (snapshot.hasError) {
                            return const Text(
                                'Check your internet Connection and try again');
                          }
                          var programData = snapshot.data;
                          return SizedBox(
                            height: 280.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: programData['items'].length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProgramCards(
                                  image: programImage[0],
                                  title: programData['items'][index]
                                      ['category'],
                                  footerText: programData['items'][index]
                                          ['lesson']
                                      .toString(),
                                  subTitle: programData['items'][index]['name'],
                                  children: const [],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Events and experiences',
                        style: GoogleFonts.lora(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: const Color(0xFF6D747A)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SvgPicture.asset(
                              'assets_svg/rightArrow_icon.svg',
                              height: 9.5.h,
                              width: 13.w,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 280.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return EventsCards(
                          image: eventImage[index],
                          title: eventsTitle[index],
                          footerText: eventsFootertext[index],
                          subTitle: eventsSubtitle[index],
                          children: const [],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lessons for you',
                        style: GoogleFonts.lora(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: const Color(0xFF6D747A)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SvgPicture.asset(
                              'assets_svg/rightArrow_icon.svg',
                              height: 9.5.h,
                              width: 13.w,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  FutureBuilder(
                    future: ApiServices().getLessonData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading');
                      } else {
                        if (snapshot.hasError) {
                          return const Text(
                              'Check your internet Connection and try again');
                        }
                        var lessonData = snapshot.data;
                        return SizedBox(
                          height: 280.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: lessonData['items'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return LessonCards(
                                image: lessonImage[0],
                                title: lessonData['items'][index]['category'],
                                footerText:
                                    '${lessonData['items'][index]['duration']} min',
                                subTitle: lessonData['items'][index]['name'],
                                children: const [],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 16,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showUnselectedLabels: true,
          items: _navItems,
          unselectedLabelStyle:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 10.sp),
          selectedLabelStyle:
              GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w600),
          unselectedItemColor: const Color(0xFF939CA3),
          selectedItemColor: const Color(0xFF598BED)),
    );
  }
}
