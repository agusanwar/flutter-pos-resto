import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posresto/core/components/components.dart';
import 'package:posresto/core/constants/colors.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final VoidCallback onTap;
  final Color color;
  final String title;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.isActive,
    required this.onTap,
    this.color = AppColors.white,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ColoredBox(
            color: isActive
                ? AppColors.disabled.withOpacity(0.50)
                : Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset(
                      iconPath,
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SpaceHeight(10.0),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
