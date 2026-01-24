# 7S-01: SCOPE

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Problem Domain

Server-side Alpine.js component generation for Eiffel web applications. The library provides a fluent API to generate HTML elements with Alpine.js directives, enabling reactive client-side behavior from server-generated markup.

## Target Users

1. **Eiffel web developers** building interactive UIs
2. **HTMX users** needing client-side state management
3. **simple_http users** generating dynamic HTML
4. **Developers** avoiding JavaScript frameworks

## Primary Use Cases

1. Generate Alpine.js-enabled HTML elements
2. Add reactive state (x-data) to components
3. Bind events (x-on, @click) from Eiffel
4. Create visibility toggles (x-show, x-if)
5. Two-way form binding (x-model)
6. Transitions and animations
7. Pre-built UI patterns (dropdowns, modals, tabs)

## Boundaries

### In Scope
- HTML element generation with Alpine directives
- All Alpine.js core directives
- Alpine.js plugin directives (collapse, focus, intersect)
- Expression builder helpers
- Pre-built component patterns
- HTMX integration (inherits from HTMX_ELEMENT)

### Out of Scope
- Runtime JavaScript execution
- Alpine.js CDN inclusion (application responsibility)
- CSS styling (use Tailwind or custom CSS)
- Client-side state persistence
- Alpine.js stores initialization

## Dependencies

- simple_htmx: Base HTMX_ELEMENT class
- EiffelBase: Standard library
