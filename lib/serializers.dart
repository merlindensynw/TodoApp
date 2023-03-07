

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'user.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  User,
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();