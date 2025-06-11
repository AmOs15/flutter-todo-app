import 'package:flutter/material.dart';

/// アプリケーション全体で使用される定数
class AppConstants {
  AppConstants._(); // プライベートコンストラクタで静的クラスにする

  // アセット画像パス
  static const String defaultAvatarPath = 'assets/images/default_avatar.png';
  
  // ヘッダー関連の定数
  static const double headerIconSize = 20.0;
  static const double headerButtonSize = 40.0;
  static const double headerLogoSize = 24.0;
  static const double headerSpacing = 12.0;
  static const EdgeInsets headerPadding = EdgeInsets.symmetric(
    horizontal: 20.0, 
    vertical: 16.0,
  );
  
  // アプリ情報
  static const String appTitle = 'TaskMaster';
}

/// ヘッダー専用のテーマクラス
class HeaderTheme {
  HeaderTheme._();
  static BoxDecoration getHeaderDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static TextStyle getTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    ) ?? const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static BoxDecoration getButtonDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(8),
    );
  }
  static Color getIconColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);
  }
}
