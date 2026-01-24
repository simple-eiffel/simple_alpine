# S04: FEATURE SPECIFICATIONS

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## ALPINE_ELEMENT Core Features

### x_data (a_state): like Current
**Purpose**: Initialize reactive state for component
**Output**: x-data="{ state }"
**Example**: `x_data ("{ open: false, count: 0 }")`

### x_init (a_expression): like Current
**Purpose**: Run expression when element initializes
**Output**: x-init="expression"
**Example**: `x_init ("console.log('mounted')")`

### x_show (a_expression): like Current
**Purpose**: Toggle visibility via CSS display
**Output**: x-show="expression"
**Behavior**: Element hidden when expression is falsy

### x_if (a_expression): like Current
**Purpose**: Conditionally add/remove from DOM
**Output**: x-if="expression"
**Note**: Must be used on `<template>` elements

### x_text (a_expression): like Current
**Purpose**: Set text content reactively
**Output**: x-text="expression"
**Behavior**: Updates innerText when expression changes

### x_on_click (a_expression): like Current
**Purpose**: Handle click event
**Output**: @click="expression"
**Variants**: x_on_click_prevent, x_on_click_stop, x_on_click_outside

### x_model (a_property): like Current
**Purpose**: Two-way binding for form inputs
**Output**: x-model="property"
**Variants**: x_model_lazy, x_model_number, x_model_debounce

### x_bind_class (a_expression): like Current
**Purpose**: Bind CSS classes reactively
**Output**: :class="expression"
**Example**: `:class="{ 'active': isActive }"`

### x_transition: like Current
**Purpose**: Apply enter/leave animations
**Output**: x-transition
**Variants**: x_transition_opacity, x_transition_scale, etc.

## ALPINE_FACTORY Expression Features

### toggle (property): STRING
**Purpose**: Generate toggle expression
**Formula**: `property = !property`
**Example**: `toggle ("open")` produces `"open = !open"`

### ternary (condition, true_val, false_val): STRING
**Purpose**: Generate ternary expression
**Formula**: `condition ? true_val : false_val`
**Example**: `ternary ("open", "'block'", "'none'")`

### class_if (class_name, condition): STRING
**Purpose**: Conditional class object
**Formula**: `{ 'class_name': condition }`
**Example**: `class_if ("active", "isActive")`

### data_object (properties): STRING
**Purpose**: Combine properties into x-data object
**Formula**: `{ prop1, prop2, ... }`
**Example**: `data_object (<<data_bool ("open", false), data_int ("count", 0)>>)`

## ALPINE_FACTORY Pattern Features

### dark_mode_data: STRING
**Returns**: `"{ dark: false }"`

### dark_mode_init: STRING
**Returns**: Expression to check localStorage and set initial class

### dark_mode_watch: STRING
**Returns**: Expression for x-effect to persist and update DOM

### dropdown_data: STRING
**Returns**: `"{ open: false }"`

### dropdown_toggle: STRING
**Returns**: `"open = !open"`

### tabs_data (default_tab): STRING
**Returns**: `"{ activeTab: 'tab_name' }"`

### tabs_select (tab): STRING
**Returns**: `"activeTab = 'tab_name'"`
