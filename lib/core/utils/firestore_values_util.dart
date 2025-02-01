Map<String, dynamic> toFirestoreValues(Map<String, dynamic> data) {
  Map<String, dynamic> values = {};

  data.forEach((key, value) {
    if (value is String) {
      values[key] = {'stringValue': value};
    } else if (value is double) {
      values[key] = {'doubleValue': value};
    } else if (value is int) {
      values[key] = {'integerValue': value};
    } else if (value is bool) {
      values[key] = {'booleanValue': value};
    } else if (value is List) {
      values[key] = {
        'arrayValue': {
          'values': value
              .map((e) => e is Map<String, dynamic> ? toFirestoreValues(e) : e)
              .toList(),
        }
      };
    } else if (value is Map<String, dynamic>) {
      values[key] = {
        'mapValue': {
          'fields': toFirestoreValues(value),
        }
      };
    }
  });

  return {
    'fields': values,
  };
}

Map<String, dynamic> getFirestoreValues(Map<String, dynamic> data) {
  Map<String, dynamic> values = {};

  data.forEach((key, value) {
    if (value.containsKey('stringValue')) {
      values[key] = value['stringValue'];
    } else if (value.containsKey('doubleValue')) {
      values[key] = value['doubleValue'];
    } else if (value.containsKey('integerValue')) {
      values[key] = value['integerValue'];
    } else if (value.containsKey('booleanValue')) {
      values[key] = value['booleanValue'];
    } else if (value.containsKey('arrayValue')) {
      values[key] = (value['arrayValue']['values'] as List)
          .map((e) => e is Map<String, dynamic> ? getFirestoreValues(e) : e)
          .toList();
    } else if (value.containsKey('mapValue')) {
      values[key] = getFirestoreValues(value['mapValue']['fields']);
    }
  });

  return values;
}
