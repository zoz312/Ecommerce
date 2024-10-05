import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:ecommerce2/core/widgets/TextFormFiledNamee.dart';
import 'package:ecommerce2/core/widgets/textFormFiledEmail.dart';
import 'package:ecommerce2/core/widgets/textFormFiledPassword.dart';
import 'package:ecommerce2/core/widgets/textFormFiledPhone.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';
import 'package:ecommerce2/feature/auth/view/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/view/widget/Alert.dart';
import 'package:ecommerce2/feature/auth/view/widget/imageprofile.dart';
import 'package:ecommerce2/feature/auth/view/widget/rowsininsinup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Bodylogin extends StatelessWidget {
  const Bodylogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is Userfailure) {
          showAlertDialog(context, state.error.toString(), onpressed: () {
            GoRouter.of(context).pop();
          });
        } else if (state is Userloaded) {
          showAlertDialog(
            context,
            state.massage.toString(),
            onpressed: () {
              GoRouter.of(context).push('/sp');
            },
          );
        } else {
          print('object');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              Text(
                'welcome back!',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
              ),
              // SizedBox(height: 10,),
              Text(
                "Sin in your account.",
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 245, 238, 238)),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              textFormFiledemail(
                controller: BlocProvider.of<UserCubit>(context).emailcontroller,
              ),
              SizedBox(
                height: 10,
              ),
              TextformFiledPassword(
                  controller:
                      BlocProvider.of<UserCubit>(context).passwordcontroller,
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
                      colorb: Colors.white,
                      text: 'Login',
                      onPressd: () {
                        
                        if (BlocProvider.of<UserCubit>(context).sinin()
                            is Userloaded) {BlocProvider.of<UserCubit>(context).sinin();
                          BlocProvider.of<UserCubit>(context)
                              .key
                              .currentState!
                              .reset();
                        }
                      },
                      color: color,
                    ),
              SizedBox(
                height: 205,
              ),
              Rowsininsinup(
                onTap: () {
                  GoRouter.of(context).push(
                    '/s',
                  );
                },
                text: 'Not a Member?',
                button: 'Join Now',
              ),
            ],
          ),
        );
      },
    );
  }
}
