import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_pattern/app/modules/home/home_controller.dart';
import 'package:getx_pattern/app/modules/home/local_widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'list_movies',
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _.logOut,
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (__, index) {
              return MovieItem(movie: _.listTopMovies[index]);
            },
            itemCount: _.listTopMovies.length,
          ),
        ),
      ),
    );
  }
}
