# S02: CLASS CATALOG

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Core Classes

### ALPINE_ELEMENT (deferred)
**Purpose**: Base class providing all Alpine.js directives
**Inherits**: HTMX_ELEMENT
**Key Feature Groups**:
- State Directives: x_data, x_init, x_data_empty
- Visibility: x_show, x_if, x_cloak
- Content: x_text, x_html
- Events: x_on, x_on_click, x_on_submit, etc. (25+ methods)
- Binding: x_bind, x_bind_class, x_bind_style, etc.
- Forms: x_model, x_model_lazy, x_model_number
- Loop: x_for
- Reference: x_ref
- Transitions: x_transition variants (12 methods)
- Plugins: x_collapse, x_trap, x_intersect

### ALPINE_FACTORY
**Purpose**: Factory for creating elements and building expressions
**Inherits**: None
**Feature Groups**:
- Element Creation: div, span, button, input, etc.
- Expression Builders: toggle, ternary, class_if, etc.
- Data Object Builders: data_bool, data_string, data_int
- Magic Properties: el, refs, store, dispatch
- Pre-built Patterns: dark_mode, dropdown, modal, tabs, etc.

## Element Classes (26 total)

All inherit from ALPINE_ELEMENT, providing tag-specific creation.

### Container Elements
- ALPINE_DIV: Generic container
- ALPINE_SPAN: Inline container
- ALPINE_SECTION: Section element
- ALPINE_NAV: Navigation container
- ALPINE_HEADER: Header section
- ALPINE_FOOTER: Footer section
- ALPINE_MAIN: Main content area
- ALPINE_ASIDE: Sidebar content
- ALPINE_ARTICLE: Article content

### Text Elements
- ALPINE_P: Paragraph
- ALPINE_H1, ALPINE_H2, ALPINE_H3: Headings

### Form Elements
- ALPINE_FORM: Form container
- ALPINE_BUTTON: Button
- ALPINE_INPUT: Text input
- ALPINE_TEXTAREA: Multi-line input
- ALPINE_SELECT: Dropdown
- ALPINE_OPTION: Select option
- ALPINE_LABEL: Form label

### List Elements
- ALPINE_UL: Unordered list
- ALPINE_OL: Ordered list
- ALPINE_LI: List item

### Media/Link Elements
- ALPINE_A: Anchor/link
- ALPINE_IMG: Image

### Special Elements
- ALPINE_TEMPLATE: Template (for x-if, x-for)
