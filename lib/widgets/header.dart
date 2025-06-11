import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'header_action_button.dart';
import 'profile_avatar.dart';

/// 改善されたアプリケーションヘッダーウィジェット
/// レビューの指摘事項を反映して以下を改善：
/// - 外部URL依存の排除
/// - テーマ統合
/// - ハードコードされた値の排除
/// - エラーハンドリングの追加
/// - アクセシビリティの改善
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.headerPadding,
      decoration: HeaderTheme.getHeaderDecoration(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftSection(context),
          _buildRightSection(context),
        ],
      ),
    );
  }

  /// ヘッダー左側のセクション（ロゴとタイトル）
  Widget _buildLeftSection(BuildContext context) {
    return Row(
      children: [
        _buildLogo(context),
        SizedBox(width: AppConstants.headerSpacing),
        _buildTitle(context),
      ],
    );
  }

  /// アプリロゴ
  Widget _buildLogo(BuildContext context) {
    return Container(
      width: AppConstants.headerLogoSize,
      height: AppConstants.headerLogoSize,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        Icons.task_alt,
        color: Theme.of(context).colorScheme.onPrimary,
        size: AppConstants.headerLogoSize * 0.67, // ロゴサイズの2/3
        semanticLabel: 'TaskMaster アプリロゴ',
      ),
    );
  }

  /// アプリタイトル
  Widget _buildTitle(BuildContext context) {
    return Text(
      AppConstants.appTitle,
      style: HeaderTheme.getTitleStyle(context),
      semanticsLabel: 'アプリケーション名: ${AppConstants.appTitle}',
    );
  }

  /// ヘッダー右側のセクション（アクションボタンとプロフィール）
  Widget _buildRightSection(BuildContext context) {
    return Row(
      children: [
        HeaderActionButton(
          icon: Icons.add,
          onPressed: () => _handleAddTask(context),
          semanticLabel: 'タスクを追加',
          tooltip: '新しいタスクを追加',
        ),
        SizedBox(width: AppConstants.headerSpacing),
        HeaderActionButton(
          icon: Icons.delete_outline,
          onPressed: () => _handleDeleteTask(context),
          semanticLabel: 'タスクを削除',
          tooltip: '選択したタスクを削除',
        ),
        SizedBox(width: AppConstants.headerSpacing),
        const ProfileAvatar(
          // アセット画像を使用（外部URL依存を排除）
          // imageUrl は将来的にユーザープロフィール機能で使用
        ),
      ],
    );
  }
  /// タスク追加アクション
  void _handleAddTask(BuildContext context) {
    // 将来的にタスク追加ダイアログまたは画面への遷移を実装予定
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('タスク追加機能は今後実装予定です'),
        duration: Duration(seconds: 2),
      ),
    );
  }  /// タスク削除アクション
  void _handleDeleteTask(BuildContext context) {
    // 将来的にタスク削除確認ダイアログを実装予定
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('タスク削除機能は今後実装予定です'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
