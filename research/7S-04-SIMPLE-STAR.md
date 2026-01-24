# 7S-04: SIMPLE-STAR INTEGRATION

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Ecosystem Dependencies

### Required Libraries

1. **simple_htmx**
   - Purpose: Base HTMX_ELEMENT class
   - Relationship: ALPINE_ELEMENT inherits HTMX_ELEMENT
   - Benefit: Single element can have both HTMX and Alpine attributes

### Optional Libraries

2. **simple_http**
   - Purpose: Web server for serving Alpine-enhanced pages
   - Integration: Generate HTML responses with Alpine elements

3. **simple_browser**
   - Purpose: Embedded browser for Alpine applications
   - Integration: Load Alpine-enabled HTML via load_htmx_page

## Integration Pattern

### Combined HTMX + Alpine

```eiffel
-- Single element with both server (HTMX) and client (Alpine) behavior
l_div := factory.div
l_div.x_data ("{ loading: false }")
     .x_show ("!loading")
     .hx_get ("/api/data")
     .hx_trigger ("click")
     .hx_indicator ("#spinner")
```

### With simple_http

```eiffel
-- In HTTP handler
create factory
l_page := factory.div
    .x_data ("{ count: 0 }")
    .add_child (
        factory.button_text ("Increment")
            .x_on_click ("count++")
    )
    .add_child (
        factory.span.x_text ("count")
    )
response.set_body (l_page.to_html)
```

### With simple_browser

```eiffel
browser.load_htmx_page (alpine_element.to_html)
-- Alpine.js CDN automatically included
```

## Libraries Using simple_alpine

1. **simple_http applications**: Web UI generation
2. **simple_browser applications**: Desktop GUI via HTML
3. **Admin dashboards**: Interactive data tables
4. **Form applications**: Client-side validation

## Namespace Conventions

- All classes prefixed with ALPINE_
- Factory: ALPINE_FACTORY
- Elements: ALPINE_DIV, ALPINE_BUTTON, etc.
- No conflicts with simple_htmx (inherits, doesn't duplicate)
