import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    var tabTextIndexSelected = 0;

    var ratio = ((itemWidth - 18) / itemHeight);
    print(ratio);

    // final HomeController controller = HomeController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HomeView',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(3),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: GetX<HomeController>(
              init: HomeController(),
              builder: (controller) => FlutterToggleTab(
                width: (itemWidth / 2) - 8,
                borderRadius: 30,
                height: 50,
                selectedIndex: controller.tabTextIndexSelected.value,
                selectedBackgroundColors: const [
                  Color(0xFFE51937),
                  Color(0xFFE51937),
                ],
                unSelectedBackgroundColors: const [
                  Colors.white,
                  Colors.white,
                ],
                selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                unSelectedTextStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                labels: const ["Now Showing", "Coming Soon"],
                icons: const [Icons.play_circle, null],
                selectedLabelIndex: (index) {
                  controller.tabTextIndexSelected.value = index;
                },
                isScroll: false,
              ),
            ),
          ),
          Expanded(
            child: controller.obx(
              (data) => GridView.builder(
                padding: EdgeInsets.only(left: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 5,
                  childAspectRatio: ratio,
                ),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    title: data?[index].title,
                    posterPath: data?[index].posterPath,
                  );
                },

                // const [
                //   MovieCard(
                //     title: "Test",
                //     posterPath: "1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                //   ),
                //   MovieCard(
                //     title: "Test",
                //     posterPath: "1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                //   ),
                //   MovieCard(
                //     title: "Test",
                //     posterPath: "1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                //   ),
                //   MovieCard(
                //     title: "Test",
                //     posterPath: "1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                //   ),
                // ],
              ),
              onError: (error) => Center(
                child: Text(error.toString()),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/movie-reel-blue.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/event-ticket-grey.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey.shade400),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey.shade400),
            label: "",
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.title, required this.posterPath})
      : super(key: key);

  final String title;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: itemWidth.round() - 20,
            height: 250,
            child: Image.network(
              "http://image.tmdb.org/t/p/w500/" + posterPath,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: const [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ],
          ),
          SizedBox(height: 8),
          Flexible(
            // height: 50,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Crime",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
                color: Colors.black87,
              ),
              SizedBox(width: 8),
              Text(
                "2hr 10 m",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(width: 8),
              Text(
                "|",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(width: 8),
              Text(
                "R",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Mango',
    'Watermelons',
    'Oranges',
    'Pear',
    'Lemons',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
    );
  }
}
