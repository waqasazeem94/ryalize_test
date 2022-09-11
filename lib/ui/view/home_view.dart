import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../viewmodel/home_viewmodel.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textform_field.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late final HomeViewModel _model;
  late final BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        _model = model;
        _context = context;
        model.onModelReady();
      },
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body:_model.isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount:model.animeList.data?.results?.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(

                      leading: Image.network(

                      "${model.animeList.data?.results?[index].imageUrl}",
                        errorBuilder: (context, error, stack){
                          return Icon(Icons.error, color: Colors.red,);
                        },
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                            title: Text( "${model.animeList.data?.results?[index].title}"),
                            // subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                            //     Icon(Icons.star , color: Colors.yellow,)
                            //   ],
                            // ),
                          ),
                  );
                })
          ),
        ),
      ),
    );
  }
}