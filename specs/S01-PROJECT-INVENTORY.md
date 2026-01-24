# S01: PROJECT INVENTORY

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Project Structure

```
simple_alpine/
├── simple_alpine.ecf           # Library configuration
├── src/
│   ├── core/
│   │   ├── alpine_element.e    # Deferred base class with directives
│   │   └── alpine_factory.e    # Factory for elements and expressions
│   ├── elements/
│   │   ├── alpine_div.e
│   │   ├── alpine_span.e
│   │   ├── alpine_button.e
│   │   ├── alpine_input.e
│   │   ├── alpine_textarea.e
│   │   ├── alpine_select.e
│   │   ├── alpine_option.e
│   │   ├── alpine_form.e
│   │   ├── alpine_label.e
│   │   ├── alpine_a.e
│   │   ├── alpine_img.e
│   │   ├── alpine_ul.e
│   │   ├── alpine_ol.e
│   │   ├── alpine_li.e
│   │   ├── alpine_p.e
│   │   ├── alpine_h1.e
│   │   ├── alpine_h2.e
│   │   ├── alpine_h3.e
│   │   ├── alpine_section.e
│   │   ├── alpine_nav.e
│   │   ├── alpine_header.e
│   │   ├── alpine_footer.e
│   │   ├── alpine_main.e
│   │   ├── alpine_aside.e
│   │   ├── alpine_article.e
│   │   └── alpine_template.e
│   └── mock_app/
│       └── mock_app.e          # Demo application
├── testing/
│   ├── test_app.e
│   ├── lib_tests.e
│   ├── test_alpine_factory.e
│   └── test_alpine_directives.e
├── research/                   # This directory
└── specs/                      # Specification directory
```

## File Count Summary

| Category | Files |
|----------|-------|
| Core source | 2 |
| Element source | 26 |
| Demo | 1 |
| Test files | 4 |
| Configuration | 1 |
| **Total** | **34** |

## External Dependencies

- EiffelBase (standard library)
- simple_htmx (base HTMX_ELEMENT class)
