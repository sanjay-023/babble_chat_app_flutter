import 'package:babbleapp/app/modules/chat/views/chat_view.dart';
import 'package:babbleapp/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchListWidget extends StatelessWidget {
  SearchListWidget({Key? key}) : super(key: key);
  final searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (context) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return searchController.searchSnapshot == null
              ? Container()
              : ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 13, 145, 18),
                  ),
                  title: Text(
                    searchController.searchSnapshot!.docs[index]
                        .get("firstname"),
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    searchController.searchSnapshot!.docs[index].get("email"),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Get.off(ChatView());
                      searchController.searchTextController.clear();
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 10, 140, 14),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Message",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
        itemCount: searchController.searchSnapshot!.docs.length,
      );
    });
  }
}
