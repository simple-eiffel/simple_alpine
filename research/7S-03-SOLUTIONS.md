# 7S-03: SOLUTIONS

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Existing Solutions Comparison

### JavaScript Frameworks

| Solution | Pros | Cons |
|----------|------|------|
| React | Full SPA capability | Complex, JS-heavy |
| Vue | Template syntax | Requires build step |
| Svelte | Compiled, small | New language |
| Alpine.js | Lightweight, HTML-centric | Less ecosystem |

### Server-Side HTML Libraries

| Solution | Pros | Cons |
|----------|------|------|
| JSX (React) | Component model | Requires React |
| Blade (PHP) | Template engine | PHP only |
| Jinja (Python) | Flexible | Python only |
| ERB (Ruby) | Mature | Ruby only |

### Eiffel Web Libraries

| Solution | Pros | Cons |
|----------|------|------|
| EWF | Full stack | No Alpine support |
| simple_htmx | HTMX generation | No Alpine directives |

## Why Build simple_alpine?

1. **No Eiffel Alternative**: First Eiffel library for Alpine.js generation
2. **HTMX Complement**: Alpine handles client-state, HTMX handles server
3. **Fluent API**: Chainable method calls for clean code
4. **Type Safety**: Compile-time checking of directive names
5. **Expression Helpers**: Build JavaScript expressions safely

## Design Decisions

1. **Inherits HTMX_ELEMENT**: Combines both HTMX and Alpine on same elements
2. **Fluent Return Type**: All methods return `like Current` for chaining
3. **Raw Attributes**: JavaScript expressions stored without HTML escaping
4. **Factory Pattern**: ALPINE_FACTORY for element creation and expressions
5. **Pre-built Patterns**: Common UI patterns as factory methods

## Architecture

```
ALPINE_ELEMENT (deferred)
    inherits HTMX_ELEMENT
    │
    ├── ALPINE_DIV
    ├── ALPINE_SPAN
    ├── ALPINE_BUTTON
    ├── ALPINE_INPUT
    ├── ALPINE_FORM
    └── ... (26+ element types)

ALPINE_FACTORY
    └── Element creation + expression builders
```
