import 'package:flutter/material.dart';
import 'package:new_mvvm/data/response/status.dart';
import 'package:new_mvvm/utils/utils.dart';
import 'package:new_mvvm/view_model/home_view_model.dart';
import 'package:new_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMovieViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUserIno();
              Utils().showSnackBar(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator(color: Colors.red,));
              case Status.ERROR:
                return Center(child: Text("Err ${value.moviesList.message.toString()}"));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (_, int i) {
                    var data = value.moviesList.data!.movies![i];
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        leading: Image.network(
                          data.posterurl,
                          fit: BoxFit.fill,
                          cacheHeight: 50,
                          cacheWidth: 50,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.info,
                              color: Colors.red,
                            );
                          },
                        ),
                        title: Text(data.title),
                        subtitle: Text(data.year),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.averageRating(data.ratings!)
                                .toStringAsFixed(1)),
                            const Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                Text("Default".toUpperCase());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
