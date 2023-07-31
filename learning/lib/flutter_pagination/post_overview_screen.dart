import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learning/flutter_pagination/post_iteam.dart';
import 'modal.dart';

class PostsOverviewScreen extends StatefulWidget {
  @override
  _PostsOverviewScreenState createState() => _PostsOverviewScreenState();
}

class _PostsOverviewScreenState extends State<PostsOverviewScreen> {
  bool? isLastPage;
  int? pageNumber;
  bool isAPICalling = false;
  bool? error;
  bool? loading;
  final int numberOfPostsPerRequest = 10;
  List<Post>? posts;
  final int nextPageTrigger = 3;

  Future<void> fetchData() async {
    try {
      print('try executed');
      final response = await get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts?_page=$pageNumber&_limit=$numberOfPostsPerRequest"));
      List responseList = json.decode(response.body.toString());

      List<Post> postList = responseList
          .map((data) => Post(data['title'], data['body']))
          .toList();
      print('resposne ::::${response.toString()}');
      print('Data :::::${responseList}');
      setState(() {
        isLastPage = postList.length < numberOfPostsPerRequest;
        loading = false;
        pageNumber = pageNumber! + 1;
        posts!.addAll(postList);
      });
    } catch (e) {
      print('catch executed');
      print("error --> $e");
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred when fetching the posts.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  loading = true;
                  error = false;
                  fetchData();
                });
              },
              child: const Text(
                "Retry",
                style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isAPICalling == true;
    setState(() {});
    pageNumber = 0;
    posts = [];
    isLastPage = false;
    loading = true;
    error = false;
    await fetchData();
    isAPICalling == false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
        centerTitle: true,
      ),
      body: isAPICalling!
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildPostsView(),
    );
  }

  Widget buildPostsView() {
    if (posts!.isEmpty) {
      if (loading!) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (error!) {
        return Center(child: errorDialog(size: 20));
      }
    }
    return ListView.builder(
        itemCount: posts!.length + (isLastPage! ? 0 : 1),
        itemBuilder: (context, index) {
          if (index == posts!.length - nextPageTrigger) {
            fetchData();
          }
          if (index == posts!.length) {
            if (error!) {
              return Center(
                child: errorDialog(size: 15),
              );
            } else {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }
          final Post post = posts![index];
          return Padding(
              padding: const EdgeInsets.all(15.0),
              child: PostItem(post.title, post.body));
        });
  }
}
