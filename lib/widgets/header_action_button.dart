import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// ヘッダーで使用する再利用可能なアクションボタン
class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? semanticLabel;
  final String? tooltip;

  const HeaderActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.semanticLabel,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.headerButtonSize,
      height: AppConstants.headerButtonSize,
      decoration: HeaderTheme.getButtonDecoration(context),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: HeaderTheme.getIconColor(context),
          size: AppConstants.headerIconSize,
          semanticLabel: semanticLabel,
        ),
        tooltip: tooltip,
      ),
    );
  }
}
