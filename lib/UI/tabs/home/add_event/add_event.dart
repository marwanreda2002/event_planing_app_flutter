import 'package:event_planing/UI/tabs/home/tab_event_widget.dart';
import 'package:event_planing/UI/tabs/widget/choose_date_time.dart';
import 'package:event_planing/UI/tabs/widget/custom_elevated_button.dart';
import 'package:event_planing/UI/tabs/widget/custom_text_field.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:event_planing/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  static String routeName = "add";

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  String? newFormatedDate;
  TimeOfDay? selectedTime;
  String? newFormatedTime;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventsImageList = [
      AssetsManager.sportImage,
      AssetsManager.birthdayImage,
      AssetsManager.meetingImage,
      AssetsManager.gamingImage,
      AssetsManager.workshopImage,
      AssetsManager.bookClubImage,
      AssetsManager.exhibitionImage,
      AssetsManager.holidayImage,
      AssetsManager.eatingImage,
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight, size: 24),
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.create_account,
          style: AppStyle.medium20Primary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * (16 / screenHeight),
            horizontal: width * (16 / screenWidth)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: height * (203 / screenHeight),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(eventsImageList[selectedIndex]),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              SizedBox(
                height: height * (40 / screenHeight),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: TabEventWidget(
                          borderColor: AppColors.primaryLight,
                          selectedTextStyle: AppStyle.bold16White,
                          unSelectedTextStyle: AppStyle.bold16Primary,
                          selectedBackGroundColor: AppColors.primaryLight,
                          eventName: eventsNameList[index],
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * (10 / screenWidth),
                      );
                    },
                    itemCount: eventsNameList.length),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: AppStyle.medium16Black,
                      ),
                      SizedBox(
                        height: height * (8 / screenHeight),
                      ),
                      CustomTextField(
                        controller: titleController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "please enter title";
                          }
                          return null;
                        },
                        prefixIcon: Icon(
                          Icons.edit,
                          color: AppColors.greyColor,
                        ),
                        hintStyle: AppStyle.medium16Grey,
                        hintText: AppLocalizations.of(context)!.event_title,
                      ),
                      SizedBox(
                        height: height * (16 / screenHeight),
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: AppStyle.medium16Black,
                      ),
                      SizedBox(
                        height: height * (8 / screenHeight),
                      ),
                      CustomTextField(
                        controller: descriptionController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "please enter description";
                          }
                          return null;
                        },
                        maxLines: 4,
                        hintStyle: AppStyle.medium16Grey,
                        hintText:
                            AppLocalizations.of(context)!.event_description,
                      ),
                      SizedBox(
                        height: height * (16 / screenHeight),
                      ),
                      ChooseDateTime(
                        icon: Icons.calendar_month,
                        dateOrTime: AppLocalizations.of(context)!.event_date,
                        chooseDateOrTime: selectedDate == null
                            ? AppLocalizations.of(context)!.choose_data
                            : newFormatedDate!,
                        onPressed: () {
                          chooseDate();
                        },
                      ),
                      SizedBox(
                        height: height * (16 / screenHeight),
                      ),
                      ChooseDateTime(
                        onPressed: () {
                          chooseTime();
                        },
                        icon: Icons.calendar_month,
                        dateOrTime: AppLocalizations.of(context)!.event_time,
                        chooseDateOrTime: selectedTime == null
                            ? AppLocalizations.of(context)!.choose_time
                            : newFormatedTime!,
                      ),
                      SizedBox(
                        height: height * (16 / screenHeight),
                      ),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: AppStyle.medium16Black,
                      ),
                      SizedBox(
                        height: height * (8 / screenHeight),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * (8 / screenWidth),
                            vertical: height * (8 / screenHeight)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: AppColors.primaryLight, width: 1),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * (12 / screenHeight),
                                  horizontal: width * (12 / screenWidth)),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.location_searching,
                                color: AppColors.whiteColor,
                                size: 22,
                              ),
                            ),
                            SizedBox(
                              width: width * (8 / screenWidth),
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .choose_event_location,
                              style: AppStyle.medium16Primary,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * (16 / screenHeight),
                      ),
                      CustomElevatedButton(
                          backgroundColor: AppColors.primaryLight,
                          text: AppLocalizations.of(context)!.add_event,
                          onTab: () {
                            addEvent();
                          })
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var date = await showDatePicker(
        context: context,
        currentDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = date;
    String formatedDate = DateFormat("dd/MM/yyyy").format(selectedDate!);
    newFormatedDate = formatedDate;
    setState(() {});
  }

  void chooseTime() async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime = time;
    newFormatedTime = selectedTime!.format(context);
    setState(() {});
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      if (selectedTime == null || selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('please enter time and date'),
        ));
      }
    }
  }
}
