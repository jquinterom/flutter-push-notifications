import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final pushMessage = context.read<NotificationsBloc>().getPushMessage(
      pushMessageId,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Push details")),
      body: pushMessage != null
          ? _DetailsView(message: pushMessage)
          : Center(child: const Text('Message not found')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage message;

  const _DetailsView({required this.message});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        spacing: 32,
        children: [
          if (message.imageUrl != null) Image.network(message.imageUrl!),

          Text(message.title, style: textStyle.titleMedium),

          Text(message.body),

          const Divider(),

          Text(message.data.toString()),
        ],
      ),
    );
  }
}
