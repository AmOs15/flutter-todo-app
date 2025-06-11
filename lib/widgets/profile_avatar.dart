import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// プロフィールアバター用のウィジェット（エラーハンドリング付き）
class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = AppConstants.headerButtonSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: _buildAvatarImage(context),
      ),
    );
  }

  Widget _buildAvatarImage(BuildContext context) {
    // アセットイメージを使用（外部URL依存を排除）
    return Image.asset(
      'assets/images/default_avatar.png',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {        // 画像読み込みエラー時のフォールバック
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.primary,
            size: size * 0.6,
          ),
        );
      },
    );
  }
}
