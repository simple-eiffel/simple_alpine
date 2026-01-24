# 7S-05: SECURITY

**Library**: simple_alpine
**Date**: 2026-01-23
**Status**: BACKWASH (reverse-engineered from implementation)

## Security Considerations

### XSS Prevention

1. **Raw Attributes Challenge**
   - Alpine expressions contain JavaScript
   - Cannot HTML-escape without breaking functionality
   - Library stores in raw_attributes map

2. **Mitigation Strategies**
   - Never include user input directly in x-data
   - Sanitize user data before including in expressions
   - Use JSON encoding for dynamic data

3. **Safe Patterns**
```eiffel
-- UNSAFE: Direct user input
l_div.x_data ("{ name: '" + user_input + "' }")  -- XSS risk!

-- SAFE: JSON encode user data
l_div.x_data ("{ name: " + json.escaped_string (user_input) + " }")
```

### Content Security Policy

1. **Inline Scripts**
   - Alpine expressions are inline JavaScript
   - Requires CSP: script-src 'unsafe-inline' (or 'unsafe-eval' for some features)
   - Consider CSP implications in security-sensitive applications

2. **CDN Loading**
   - Alpine.js typically loaded from CDN
   - Add CDN to script-src whitelist
   - Consider self-hosting for security

### DOM-based Vulnerabilities

1. **x-html Directive**
   - Renders HTML directly - XSS risk
   - Only use with trusted content
   - Prefer x-text for user data

2. **x-bind:href**
   - Could create javascript: URLs
   - Validate URLs before binding
   - Use allowlist for URL schemes

### Event Handler Safety

1. **@click Expressions**
   - Executes JavaScript on click
   - Ensure expressions are developer-controlled
   - Never build from untrusted input

## Recommendations

1. **Treat expressions as code**: Apply same scrutiny as JavaScript
2. **Sanitize all user input**: Before including in any Alpine attribute
3. **Use factory helpers**: Prefer type-safe expression builders
4. **Audit dynamic content**: Review all places user data enters expressions
5. **CSP headers**: Configure appropriate Content-Security-Policy
