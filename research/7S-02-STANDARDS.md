# 7S-02: STANDARDS

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Applicable Standards

### Alpine.js Specification

1. **Alpine.js v3**: Primary target version
   - Documentation: https://alpinejs.dev/
   - Core directives: x-data, x-init, x-show, x-if, x-for, etc.
   - Event syntax: @click, x-on:click
   - Binding syntax: :class, x-bind:class

2. **Alpine.js Plugins**
   - Collapse: x-collapse directive
   - Focus: x-trap directive
   - Intersect: x-intersect directive

### HTML Standards

1. **HTML5**: Valid attribute names
2. **Custom Attributes**: x-* and @* prefixes
3. **Template Element**: Required for x-if, x-for

### JavaScript Expressions

1. **Expression Syntax**: Valid JavaScript in attribute values
2. **Object Literals**: { key: value } for x-data
3. **Ternary Expressions**: condition ? true : false
4. **Arrow Functions**: () => {} (avoided in some contexts)

## Directive Reference

### State Directives
| Directive | Purpose | Example |
|-----------|---------|---------|
| x-data | Initialize state | x-data="{ open: false }" |
| x-init | Run on init | x-init="console.log('hi')" |

### Visibility Directives
| Directive | Purpose | Example |
|-----------|---------|---------|
| x-show | Toggle display | x-show="open" |
| x-if | Conditional DOM | x-if="items.length > 0" |
| x-cloak | Hide until init | x-cloak |

### Content Directives
| Directive | Purpose | Example |
|-----------|---------|---------|
| x-text | Set text | x-text="message" |
| x-html | Set HTML | x-html="content" |

### Event Directives
| Directive | Purpose | Example |
|-----------|---------|---------|
| x-on:event | Event handler | x-on:click="handler()" |
| @event | Shorthand | @click="handler()" |
| .prevent | Modifier | @click.prevent |
| .stop | Modifier | @click.stop |
| .outside | Modifier | @click.outside |

### Binding Directives
| Directive | Purpose | Example |
|-----------|---------|---------|
| x-bind:attr | Bind attribute | x-bind:class="{ active: isActive }" |
| :attr | Shorthand | :class="{ active: isActive }" |
| x-model | Two-way bind | x-model="name" |
