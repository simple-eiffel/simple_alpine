# S05: CONSTRAINTS

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Technical Constraints

### Runtime Requirements
- Alpine.js v3 must be loaded in browser
- CDN or local Alpine.js file
- Modern browser with JavaScript enabled

### Generated HTML Constraints
- Directive values must be valid JavaScript
- x-if, x-for require `<template>` element
- x-cloak requires CSS: `[x-cloak] { display: none !important; }`

### Expression Syntax Constraints
- No semicolons in single expressions (use comma operator if needed)
- Arrow functions may cause escaping issues in attributes
- Template literals (``) not recommended in attributes

### Attribute Storage
- Alpine directives stored in raw_attributes (not escaped)
- Standard HTML attributes stored in attributes (escaped)
- Both merged during HTML generation

## API Constraints

### Fluent Pattern
- All directive methods return `like Current`
- Allows chaining: `.x_data(...).x_show(...).x_on_click(...)`
- No side effects beyond attribute setting

### Factory Methods
- Expression builders return STRING (not elements)
- Element creation returns concrete element type
- Pattern methods return STRING expressions

### Inheritance
- All element classes inherit ALPINE_ELEMENT
- ALPINE_ELEMENT inherits HTMX_ELEMENT
- HTMX_ELEMENT inherits HTML_ELEMENT (assumed)

## Browser Constraints

### Alpine.js Compatibility
- Targets Alpine.js v3.x
- Some directives require plugins (collapse, focus, intersect)
- Plugin scripts must be loaded before Alpine

### CSP Considerations
- Inline JavaScript requires appropriate CSP headers
- script-src must allow Alpine.js source
- unsafe-inline or unsafe-eval may be needed

### DOM Requirements
- x-if elements replaced with actual elements
- x-for creates elements dynamically
- x-teleport moves elements in DOM

## Development Constraints

### Testing
- Unit tests verify HTML output
- Integration tests require browser/webview
- Alpine behavior tested in actual browser

### Debugging
- Use Alpine devtools browser extension
- Console errors show Alpine expression issues
- x-init with console.log for debugging
