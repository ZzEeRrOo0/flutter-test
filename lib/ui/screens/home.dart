import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_flutter_demo/core/constant/app_contant.dart';
import 'package:morphosis_flutter_demo/core/constant/colors.dart';
import 'package:morphosis_flutter_demo/ui/cubit/home_cubit.dart';
import 'package:morphosis_flutter_demo/ui/cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Music"),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* In this section we will be testing your skills with network and local storage. You need to fetch data from any open source api from the internet. 
             E.g: 
             https://any-api.com/
             https://rapidapi.com/collection/best-free-apis?utm_source=google&utm_medium=cpc&utm_campaign=Beta&utm_term=%2Bopen%20%2Bsource%20%2Bapi_b&gclid=Cj0KCQjw16KFBhCgARIsALB0g8IIV107-blDgIs0eJtYF48dAgHs1T6DzPsxoRmUHZ4yrn-kcAhQsX8aAit1EALw_wcB
             Implement setup for network. You are free to use package such as Dio, Choppper or Http can ve used as well.
             Upon fetching the data try to store thmm locally. You can use any local storeage. 
             Upon Search the data should be filtered locally and should update the UI.
            */

            CupertinoSearchTextField(
              controller: context.read<HomeCubit>().searchTextField,
              onChanged: (value) => context.read<HomeCubit>().searchSong(value),
              placeholder: "Search by artist or name of song",
            ),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => previous.dataStatus != current.dataStatus,
                builder: (context, state) {
                  if(state.dataStatus == DataStatus.failure) {
                    return Center(
                      child: Text("Something wrong when load data!!!", style: TextStyle(color: Colors.red),),
                    );
                  }

                  if(state.dataStatus == DataStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(color: CustomColors.primaryColor,),
                    );
                  }

                  return ListView.builder(
                    controller: context.read<HomeCubit>().scrollController,//new line
                    itemCount: state.songs?.length,
                    shrinkWrap: true ,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        height: 100.0,
                        child: Row(
                          children: [
                            Image.network(
                              state.songs![index].song_art_image_url,
                              width: 100.0,
                              height: 100.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(state.songs![index].full_title, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Text(state.songs![index].artist_names, style: TextStyle(color: Colors.black, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis,)
                              ],
                            ))
                          ],
                        ),
                      );
                    }
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
