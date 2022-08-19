# macos_user_attention

A Flutter Plugin for MacOS User Attention API

<img src="https://raw.githubusercontent.com/raj457036/macos_user_attention/main/preview.png" height="200">

## Getting Started

### Step 1: Add the package to `pubspec.yaml`
```yaml

dependencies:
    macos_user_attention:
```

### Step 2: Initialize `MacosUserAttention()`

```dart
import 'package:macos_user_attention/macos_user_attention.dart';

final _plugin = MacosUserAttention();
```

### Request User Attention

There are two types of requests you can ask for 
```dart
enum RequestUserAttentionType {
  critical,
  informational,
}
```

#### Critical Request
```dart
final requestId = await _plugin.requestUserAttention(
        RequestUserAttentionType.critical,
    );

```

#### Informational Request
```dart
final requestId = await _plugin.requestUserAttention(
        RequestUserAttentionType.informational,
    );

```

#### Cancel Request
```dart
await _plugin.cancelAttentionRequest(requestId);

```


# NOTE: 
- **You can only request user attention if your app is not in focus.**
