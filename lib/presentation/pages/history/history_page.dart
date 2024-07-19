import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/pages/history/favorite_view.dart';
import 'package:healtheats/presentation/pages/history/recommendation_view.dart';
import 'package:healtheats/presentation/providers/favorite_food_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FavoriteFoodProvider>(context, listen: false)
          .getAllFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        backgroundColor: AppColors.greyBg,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.white,
              child: const TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.primaryColor,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  unselectedLabelColor: AppColors.textGray,
                  tabs: [
                    Tab(
                      text: 'Favorite',
                    ),
                    Tab(
                      text: 'Recommendations',
                    )
                  ]),
            ),
            Expanded(
                child: TabBarView(children: [
              const FavoriteView(),
              RecommendationsView(),
            ]))
          ],
        ),
      ),
    );
  }
}
