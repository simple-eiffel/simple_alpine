# S06: BOUNDARIES

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## System Boundaries

### Architecture Diagram

```
┌────────────────────────────────────────────────────────────────┐
│                      Eiffel Application                         │
├────────────────────────────────────────────────────────────────┤
│                       simple_alpine                             │
│  ┌────────────────┐  ┌─────────────────────────────────────┐  │
│  │ ALPINE_FACTORY │  │        ALPINE_ELEMENT              │  │
│  │                │  │  (26+ concrete element classes)    │  │
│  └────────────────┘  └─────────────────┬───────────────────┘  │
│                                         │                       │
│  ┌──────────────────────────────────────┴───────────────────┐ │
│  │                     simple_htmx                           │ │
│  │                   HTMX_ELEMENT (base)                    │ │
│  └──────────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────────┘
                              │
                              │ .to_html()
                              ▼
┌────────────────────────────────────────────────────────────────┐
│                     HTML Output (STRING)                        │
│  <div x-data="{ open: false }" x-show="open" @click="...">    │
└────────────────────────────────────────────────────────────────┘
                              │
                              │ HTTP Response / Browser
                              ▼
┌────────────────────────────────────────────────────────────────┐
│                        Web Browser                              │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │                    Alpine.js Runtime                      │ │
│  │  - Parses x-* directives                                 │ │
│  │  - Creates reactive state                                │ │
│  │  - Binds event handlers                                  │ │
│  │  - Updates DOM on state change                           │ │
│  └──────────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────────┘
```

### Class Hierarchy

```
HTML_ELEMENT (from simple_html)
     ↓
HTMX_ELEMENT (from simple_htmx)
     ↓
ALPINE_ELEMENT (deferred)
     ↓
├── ALPINE_DIV
├── ALPINE_SPAN
├── ALPINE_BUTTON
├── ALPINE_INPUT
├── ALPINE_FORM
└── ... (26 element types)
```

## Interface Boundaries

### Public API
- ALPINE_FACTORY: Element creation and expression building
- All ALPINE_* element classes: Direct instantiation
- All directive methods: x_data, x_show, x_on_click, etc.

### Internal Implementation
- set_alpine_attribute: Stores to raw_attributes
- raw_attributes hash table: Unescaped directive storage

## Data Flow

### Input
- JavaScript expressions (strings)
- State objects (strings in JSON format)
- Event handler expressions (strings)

### Output
- HTML strings with Alpine directives
- Properly formatted attribute values
- Combined HTMX + Alpine attributes

## Integration Points

### simple_htmx
- Inherits HTMX_ELEMENT
- Reuses attribute storage
- Reuses HTML generation

### simple_http
- Generated HTML in responses
- Server-rendered Alpine pages

### simple_browser
- load_htmx_page includes Alpine CDN
- Client-side Alpine execution
