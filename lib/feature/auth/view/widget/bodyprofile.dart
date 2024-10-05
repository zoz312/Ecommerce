import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:ecommerce2/feature/auth/view/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/view/widget/listTitleuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Bodyprofile extends StatelessWidget {
  const Bodyprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is getloaded) {
        String text = state.modelsinup.data!.name.toString();
         String firstLetter = text[0];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            
            children: [
              const SizedBox(height: 100),
              Center(
                child: logo(firstLetter: firstLetter),
              ),
              const SizedBox(height: 20),

              //! Name
              Listtitleuser(
                  text: state.modelsinup.data!.name.toString(),
                  icon: Icon(Icons.person, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              const SizedBox(height: 16),

              //! Email

              Listtitleuser(
                  text: state.modelsinup.data!.email.toString(),
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              const SizedBox(height: 16),

              //! Phone number
              Listtitleuser(
                  text: state.modelsinup.data!.phone.toString(),
                  icon: Icon(Icons.phone, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              const SizedBox(height: 100),

              //! Address
              Center(
                child: CustomButton(
                    text: 'logout',
                    onPressd: () {
                      BlocProvider.of<UserCubit>(context).Sinout();
                      GoRouter.of(context).push('/l');
                    },
                    color: color,
                    colorb: Colors.white),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      } else if (state is Userfailure) {
        return Center(
            child: Text(
          state.error,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

class logo extends StatelessWidget {
  const logo({
    super.key,
    required this.firstLetter,
  });

  final String firstLetter;

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text(firstLetter,style:TextStyle(color: Colors.white,fontSize: 50) ,)),width: 120,height: 120,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(160)
    ),
    );
  }
}
