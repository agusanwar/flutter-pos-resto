import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posresto/core/assets/assets.gen.dart';
import 'package:posresto/core/components/spaces.dart';
import 'package:posresto/core/constants/colors.dart';
import 'package:posresto/core/extensions/build_context_ext.dart';
import 'package:posresto/data/datasource/auth_local_datasource.dart';
import 'package:posresto/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:posresto/presentation/auth/login_page.dart';
import 'package:posresto/presentation/home/pages/home_page.dart';
import 'package:posresto/presentation/home/widgets/nav_item.dart';
import 'package:posresto/presentation/setting/pages/sync_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('This is page 1')),
    const Center(child: Text('This is page 2')),
    const SyncDataPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(80.0)),
                child: SizedBox(
                  height: context.deviceHeight - 10.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        color: AppColors.primary,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavItem(
                            iconPath: Assets.icons.homeResto.path,
                            isActive: _selectedIndex == 0,
                            onTap: () => _onItemTapped(0),
                            title: 'Home',
                          ),
                          NavItem(
                            iconPath: Assets.icons.discount.path,
                            isActive: _selectedIndex == 1,
                            onTap: () => _onItemTapped(1),
                            title: 'Category',
                          ),
                          NavItem(
                            iconPath: Assets.icons.dashboard.path,
                            isActive: _selectedIndex == 2,
                            onTap: () => _onItemTapped(2),
                            title: 'Product',
                          ),
                          NavItem(
                            iconPath: Assets.icons.setting.path,
                            isActive: _selectedIndex == 3,
                            onTap: () => _onItemTapped(3),
                            title: 'Setting',
                          ),
                          const SpaceHeight(40.0),
                          BlocListener<LogoutBloc, LogoutState>(
                            listener: (context, state) {
                              state.maybeMap(
                                orElse: () {},
                                error: (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.message),
                                      backgroundColor: AppColors.red,
                                    ),
                                  );
                                },
                                success: (value) {
                                  AuthLocalDataSource().removeAuthData();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Logout success'),
                                      backgroundColor: AppColors.primary,
                                    ),
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginPage();
                                  }));
                                },
                              );
                            },
                            child: NavItem(
                              iconPath: Assets.icons.logout.path,
                              isActive: false,
                              title: 'Logout',
                              onTap: () {
                                context
                                    .read<LogoutBloc>()
                                    .add(const LogoutEvent.logout());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
