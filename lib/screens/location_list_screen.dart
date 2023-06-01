import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/location.dart';

import 'package:rick_and_morty/screens/character_list_screen.dart';
import 'package:rick_and_morty/services/ApiServiceProvider.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/widgets/loaction_Items.dart';
import 'package:page_transition/page_transition.dart';

class LocationListScreen extends StatefulWidget {
  @override
  _LocationListScreenState createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  final ApiServiceProvider apiService = ApiServiceProvider();
  final List<String> items1 = List.generate(30, (index) => 'Item ${index + 1}');
  final PageController pageController = PageController();

  int currentPage = 0;

  var loading = false;
  @override
  void initState() {
    super.initState();

    Provider.of<ApiServiceProvider>(context, listen: false)
        .fetchLocations()
        .then((location) {
      Provider.of<ApiServiceProvider>(context, listen: false)
          .addItemlocation(location);

      setState(() {
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        backgroundColor: Colors.white,
        flexibleSpace: Center(
            child: Image.asset(
          "assets/logo.png",
          height: 50,
        )),
      ),
      body: Consumer<ApiServiceProvider>(
        builder: (context, providerValue, _) => loading
            ? PageView.builder(
                physics: currentPage >=
                        ((providerValue.locationsList.length / 3)).floor()
                    ? NeverScrollableScrollPhysics()
                    : AlwaysScrollableScrollPhysics(),
                controller: pageController,
                itemCount: providerValue.locationsList.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  int startIndex = index * 3;
                  int endIndex = (index + 1) * 3;
                  List<Location> pageItems = endIndex >
                          providerValue.locationsList.length
                      ? providerValue.locationsList.sublist(
                          startIndex,
                          endIndex -
                              (endIndex - providerValue.locationsList.length))
                      : providerValue.locationsList
                          .sublist(startIndex, endIndex);

                  return Wrap(children: [
                    ListView.builder(
                      itemCount: pageItems.length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return GestureDetector(
                            onTap: () {
                              providerValue
                                  .setLocationvalue(pageItems[itemIndex].name);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    ctx: context,
                                    duration: Duration(seconds: 2),
                                    child: CharacterListScreen(),
                                    type: PageTransitionType.theme,
                                    childCurrent: LocationListScreen(),
                                    reverseDuration: Duration(seconds: 2),
                                  ));
                            },
                            child: loactionItems(
                              locationObject: pageItems[itemIndex],
                            ));
                      },
                    )
                  ]);
                },
              )
            : Center(child: const CircularProgressIndicator()),
      ),
      bottomNavigationBar: Consumer<ApiServiceProvider>(
        builder: (context, providerValue, _) => loading
            ? Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: size.width / 9,
                        child: IconButton(
                            onPressed: currentPage == 0
                                ? null
                                : () {
                                    setState(() {
                                      currentPage--;
                                      pageController.jumpToPage(currentPage);
                                    });
                                  },
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 20,
                            ))),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = 0;
                          pageController.jumpToPage(0);
                        });
                      },
                      child: Container(
                          width: size.width / 9,
                          child: Text(
                            "1",
                            style: TextStyle(
                                color: currentPage == 0
                                    ? Colors.grey
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          )),
                    ),
                    currentPage == 0
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            width: size.width / 9,
                            child: Text("...",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'))),
                    currentPage == 0
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            width: size.width / 9,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentPage--;
                                  pageController.jumpToPage(currentPage);
                                });
                              },
                              child: Text(
                                "${currentPage}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                    Container(
                      width: size.width / 9,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFD9D9D9)),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            currentPage;
                            pageController.jumpToPage(currentPage);
                          });
                        },
                        child: Text("${currentPage + 1}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins')),
                      ),
                    ),
                    currentPage >=
                            ((providerValue.locationsList.length / 3) - 1)
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            width: size.width / 9,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentPage++;
                                  pageController.jumpToPage(currentPage);
                                });
                              },
                              child: Text("${currentPage + 2}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins')),
                            ),
                          ),
                    currentPage >=
                            ((providerValue.locationsList.length / 3) - 1)
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            width: size.width / 9,
                            child: Text(
                              "...",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                            )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage =
                                (providerValue.locationsList.length / 3)
                                        .ceil() -
                                    1;
                            pageController.jumpToPage(
                                (providerValue.locationsList.length / 3)
                                        .ceil() -
                                    1);
                          });
                        },
                        child: Container(
                            width: size.width / 9,
                            child: Text(
                              "${(providerValue.locationsList.length / 3).ceil()}",
                              style: TextStyle(
                                  color: currentPage ==
                                          (providerValue.locationsList.length /
                                                      3)
                                                  .ceil() -
                                              1
                                      ? Colors.grey
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                            ))),
                    Container(
                        width: size.width / 9,
                        child: IconButton(
                          onPressed: currentPage >=
                                  ((providerValue.locationsList.length / 3) - 1)
                              ? null
                              : () {
                                  setState(() {
                                    currentPage++;
                                    pageController.jumpToPage(currentPage);
                                  });
                                },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                        )),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
