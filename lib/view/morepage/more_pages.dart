import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukm_desk_app/constants.dart';
import 'package:ukm_desk_app/cubit/profile/profile_cubit.dart';
import 'package:ukm_desk_app/theme/homeTheme.dart';
import 'package:ukm_desk_app/util/cache_util.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key, required this.animationController})
      : super(key: key);
  final AnimationController animationController;

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  // DataPic _dataPic = DataPic();
  bool isLogin = false;
  String userName = '';
  String phone = '';
  String picName = '';
  String picPhone = '';
  String picEmail = '';

  void getPicName() async {
    var _picName = await CacheUtil.getString(CACHE_PICNAME);

    setState(() {
      picName = _picName;
    });
  }

  void getPicPhone() async {
    var _picPhone = await CacheUtil.getString(CACHE_PICPHONE);

    setState(() {
      picPhone = _picPhone;
    });
  }

  void getPicEmail() async {
    var _picEmail = await CacheUtil.getString(CACHE_PICEMAIL);

    setState(() {
      picEmail = _picEmail;
    });
  }

  void getName() async {
    var _userName = await CacheUtil.getString(CACHE_NAME);
    print('user more $userName');
    setState(() {
      userName = _userName;
    });
  }

  void getPhone() async {
    var _phone = await CacheUtil.getString(CACHE_PHONE);
    setState(() {
      phone = _phone;
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
    getPhone();
    getPicName();
    getPicPhone();
    getPicEmail();
  }

  @override
  Widget build(BuildContext context) {
    print('build $userName');
    CacheUtil.getBoolean(CACHE_IS_LOGIN).then((value) {
      if (value) {
        isLogin = value;
      }
    });
    print('sudah login = $isLogin');

    Widget headerWasLogin() {
      return Container(
        height: 100,
        width: double.infinity,
        color: HomeTheme.red,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 21, bottom: 21, right: 16),
              child: Container(
                height: 56,
                width: 56,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: greyColor,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$userName',
                  style:
                      whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$phone',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget contentWasLogin() {
      return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            if (state.profileData.isEmpty || state.profileData == null) {
              return SizedBox();
            } else {
              return Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListCompany(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.business_center_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Daftar Perusahaan'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListAddress(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Daftar Alamat'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Alert(
                            style: AlertStyle(
                                backgroundColor: purpleColor,
                                titleStyle: TextStyle(color: whiteColor)),
                            context: context,
                            title: 'Your PIC',
                            content: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                print('state profile $state');
                                if (state is ProfileLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is ProfileLoaded) {
                                  // final dataPic = state.picData['name'];

                                  // print('pci: $dataPic');
                                  return Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.person,
                                          size: 98,
                                          color: greyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name',
                                            style: orangeTextStyle.copyWith(
                                                fontSize: 12, fontWeight: bold),
                                          ),
                                          Text(
                                            picName,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 12, fontWeight: bold),
                                          ),
                                          Text(
                                            'Email',
                                            style: orangeTextStyle.copyWith(
                                                fontSize: 12, fontWeight: bold),
                                          ),
                                          Container(
                                            width: 130,
                                            height: 40,
                                            child: Text(
                                              picEmail,
                                              maxLines: 2,
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: bold),
                                            ),
                                          ),
                                          Text(
                                            'Phone Number',
                                            style: orangeTextStyle.copyWith(
                                                fontSize: 12, fontWeight: bold),
                                          ),
                                          Text(
                                            picPhone,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 12, fontWeight: bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                            buttons: [
                              DialogButton(
                                  color: Colors.red,
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  }),
                            ]).show();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.support_agent,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Info PIC'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationNav(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('History'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TaxTools(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.build_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Tax Tools'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DownloadNav(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.download_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Downloads'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChangesPassword(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.vpn_key_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Ubah kata sandi'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_center_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Help'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TermAndCondition(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Icon(
                              Icons.group_outlined,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Privacy and Terms'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                              context: context,
                              title: 'Konfirmasi',
                              desc: 'Anda yakin ingin keluar dari aplikasi?',
                              buttons: [
                                DialogButton(
                                    color: Colors.red,
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => Home(
                                          selectedPage: 0,
                                          drawBottomMenu: false,
                                        ),
                                      ));
                                      CacheUtil.clear();
                                    }),
                                DialogButton(
                                    color: Colors.red,
                                    child: Text(
                                      'No',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }),
                              ]).show();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: HomeTheme.red,
                              size: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Container();
          }
        },
      );
    }

    // Widget belumLogin() {
    //   return Column(
    //     children: [headerNotLogin(), contentNotLogin()],
    //   );
    // }

    Widget sudahLogin() {
      return Column(
        children: [headerWasLogin(), contentWasLogin()],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: darkTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: HomeTheme.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.help_outline_rounded,
                color: darkColor,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [sudahLogin()],
      ),
    );
  }
}

class NonLoginMore extends StatelessWidget {
  const NonLoginMore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: darkTextStyle.copyWith(fontSize: 15, fontWeight: bold),
        ),
        backgroundColor: HomeTheme.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.help_outline_rounded,
                color: darkColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FaqDetail(),
                  ),
                );
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: HomeTheme.red,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 21, bottom: 21, right: 16),
                  child: Container(
                    height: 56,
                    width: 56,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'None',
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        'Silahkan Login',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TaxTools(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.build_outlined,
                          color: HomeTheme.red,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Tax Tools'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DownloadNav(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_outlined,
                          color: HomeTheme.red,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Downloads'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TermAndCondition(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.group_outlined,
                          color: HomeTheme.red,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Privacy and Terms'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.login_outlined,
                          color: HomeTheme.red,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
