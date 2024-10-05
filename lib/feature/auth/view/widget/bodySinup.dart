import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:ecommerce2/core/widgets/TextFormFiledNamee.dart';
import 'package:ecommerce2/core/widgets/textFormFiledEmail.dart';
import 'package:ecommerce2/core/widgets/textFormFiledPassword.dart';
import 'package:ecommerce2/core/widgets/textFormFiledPhone.dart';
import 'package:ecommerce2/feature/auth/view/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/view/widget/Alert.dart';
import 'package:ecommerce2/feature/auth/view/widget/imageprofile.dart';
import 'package:ecommerce2/feature/auth/view/widget/rowsininsinup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Bodysinup extends StatelessWidget {
  Bodysinup({super.key});
  String imageUrl = 'assets/scholar.png';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is Userfailure) {
              showAlertDialog(context, state.error.toString(),onpressed: (){
          GoRouter.of(context).pop();
         });
            } else if (state is Userloaded) {
               showAlertDialog(context, state.massage.toString(),onpressed: () {
            GoRouter.of(context).push('/sp');
          },);
            } else {
              print('object');
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<UserCubit>(context).key2,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Sinup',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create an account so you can order you favorite prodfuct esaily and quickly",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 245, 238, 238)),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textFormFiledname(
                        controller:
                            BlocProvider.of<UserCubit>(context).namecontroller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textFormFiledPhone(
                        controller:
                            BlocProvider.of<UserCubit>(context).phonecontroller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textFormFiledemail(
                        controller: BlocProvider.of<UserCubit>(context)
                            .emailcontroller2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextformFiledPassword(
                          controller: BlocProvider.of<UserCubit>(context)
                              .passwordcontroller2,
                          text: 'password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      state is Userloading
                          ? Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: 'Sin up',
                              onPressd: () {
                                BlocProvider.of<UserCubit>(context).sinup();
                              },
                              colorb: Colors.white,
                              color: color,
                            ),
                      SizedBox(
                        height: 150,
                      ),
                      Rowsininsinup(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        text: 'Already Have An Account ?  ',
                        button: 'Log In',
                      ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}
