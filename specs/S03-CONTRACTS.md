# S03: CONTRACTS

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## ALPINE_ELEMENT Contracts

### Feature: x_data
```eiffel
x_data (a_state: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        attribute_set: attached raw_attributes.item ("x-data") as v
            and then v.same_string (a_state.to_string_32)
```

### Feature: x_show
```eiffel
x_show (a_expression: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        attribute_set: attached raw_attributes.item ("x-show") as v
            and then v.same_string (a_expression.to_string_32)
```

### Feature: x_on
```eiffel
x_on (a_event, a_expression: READABLE_STRING_GENERAL): like Current
    require
        event_not_empty: not a_event.is_empty
    ensure
        fluent_result: Result = Current
        attribute_set: raw_attributes.has ("x-on:" + a_event.to_string_8)
```

### Feature: x_on_input_debounce
```eiffel
x_on_input_debounce (a_expression: READABLE_STRING_GENERAL; a_ms: INTEGER): like Current
    require
        positive_ms: a_ms > 0
    ensure
        fluent_result: Result = Current
        attribute_set: raw_attributes.has ("@input.debounce." + a_ms.out + "ms")
```

### Feature: x_model_debounce
```eiffel
x_model_debounce (a_property: READABLE_STRING_GENERAL; a_ms: INTEGER): like Current
    require
        positive_ms: a_ms > 0
    ensure
        fluent_result: Result = Current
        attribute_set: raw_attributes.has ("x-model.debounce." + a_ms.out + "ms")
```

### Feature: x_transition_duration
```eiffel
x_transition_duration (a_ms: INTEGER): like Current
    require
        positive_ms: a_ms > 0
    ensure
        fluent_result: Result = Current
        attribute_set: attributes.has ("x-transition.duration." + a_ms.out + "ms")
```

## ALPINE_FACTORY Contracts

### Feature: toggle
```eiffel
toggle (a_property: STRING): STRING
    require
        property_not_empty: not a_property.is_empty
    ensure
        result_not_empty: not Result.is_empty
        contains_property: Result.has_substring (a_property)
        contains_negation: Result.has_substring ("!")
```

### Feature: class_if
```eiffel
class_if (a_class, a_condition: STRING): STRING
    require
        class_not_empty: not a_class.is_empty
        condition_not_empty: not a_condition.is_empty
    ensure
        result_not_empty: not Result.is_empty
        starts_with_brace: Result.starts_with ("{ ")
        ends_with_brace: Result.ends_with (" }")
        contains_class: Result.has_substring (a_class)
```

### Feature: accordion_toggle
```eiffel
accordion_toggle (a_index: INTEGER): STRING
    require
        non_negative_index: a_index >= 0
    ensure
        result_not_empty: not Result.is_empty
        contains_activeindex: Result.has_substring ("activeIndex")
```

### Invariant (inherited from HTMX_ELEMENT)
```eiffel
invariant
    -- ALPINE_ELEMENT inherits HTMX_ELEMENT's invariant
    -- Alpine directives are attributes in the hash table
```
