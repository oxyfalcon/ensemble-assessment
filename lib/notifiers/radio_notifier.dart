import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupNotifier extends StateNotifier<Map<String, String>> {
  GroupNotifier() : super({});

  void addGroup(String groupId, bool isDefault, String radioValue) {
    if (!state.containsKey(groupId)) {
      Map<String, String> temp = state;
      Map<String, String> entry =
          (isDefault) ? {groupId: radioValue} : {groupId: ""};
      temp.addEntries(entry.entries);
      state = temp;
    }
    if (isDefault) {
      state[groupId] = radioValue;
    }
  }

  void setGroupValue(String groupId, String groupValue) {
    Map<String, String> temp = Map.from(state);
    temp[groupId] = groupValue;
    state = temp;
  }
}

final groupProvider =
    StateNotifierProvider<GroupNotifier, Map<String, String>>((ref) {
  return GroupNotifier();
});
