import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:mcqer/bloc/user_bloc.dart';
import 'package:mcqer/models/UserModel.dart';
import 'package:mcqer/network/UserRepository.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
        title: const Text('the blog app'),
      ),
      body: BlocBuilder<UserBloc,UserState>(
        builder: (context,state){
          
          if(state is UserLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is UserLoadedState){
             List<UserModel> usersList=state.users;
            return ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (_,index){
                  return Card(
                    color: Colors.amber,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10) ,
                    child: ListTile(
                      title: Text(usersList[index].title),

                    ),
                  );
              }
              );
          }

           if(state is UserErrorState){
            return const Center(
              child: Text('Error !'),
            );
          }

          return Container(
           
          );
        },
        
      ),
      ),
      
    );
  }
}
