note
	description: "[
		Deferred class providing Alpine.js directives for HTML elements.

		Designed to be inherited alongside HTMX_ELEMENT descendants,
		giving elements both HTMX (server) and Alpine (client) capabilities.

		Example:
			l_div := create {ALPINE_DIV}.make
			l_div.x_data ("{ open: false }")
			     .x_show ("open")
			     .x_on_click ("open = !open")
			     .hx_get ("/api/data")  -- HTMX still works!
			     .to_html_8
			-- Output: <div x-data="{ open: false }" x-show="open"
			--         @click="open = !open" hx-get="/api/data"></div>
	]"
	author: "Larry Rix with Claude"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ALPINE_ELEMENT

inherit
	HTMX_ELEMENT

feature -- Alpine: State Directives

	x_data (a_state: READABLE_STRING_GENERAL): like Current
			-- Initialize reactive state for this component.
			-- Example: x_data ("{ open: false, count: 0 }")
		do
			set_alpine_attribute ("x-data", a_state)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-data") as v and then v.same_string (a_state.to_string_32)
		end

	x_data_empty: like Current
			-- Initialize empty state (common for event-only components).
			-- Example output: x-data
		do
			attributes.force ("", "x-data")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-data")
			value_empty: attached attributes.item ("x-data") as v and then v.is_empty
		end

	x_init (a_expression: READABLE_STRING_GENERAL): like Current
			-- Run expression when element initializes.
			-- Example: x_init ("console.log('mounted')")
		do
			set_alpine_attribute ("x-init", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-init") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Visibility Directives

	x_show (a_expression: READABLE_STRING_GENERAL): like Current
			-- Toggle visibility based on expression (uses CSS display).
			-- Example: x_show ("open")
		do
			set_alpine_attribute ("x-show", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-show") as v and then v.same_string (a_expression.to_string_32)
		end

	x_if (a_expression: READABLE_STRING_GENERAL): like Current
			-- Conditionally add/remove element from DOM.
			-- NOTE: Must be used on <template> elements.
			-- Example: x_if ("items.length > 0")
		do
			set_alpine_attribute ("x-if", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-if") as v and then v.same_string (a_expression.to_string_32)
		end

	x_cloak: like Current
			-- Hide element until Alpine initializes (prevents flash of unstyled content).
			-- Requires CSS: [x-cloak] { display: none !important; }
		do
			attributes.force ("", "x-cloak")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-cloak")
		end

feature -- Alpine: Content Directives

	x_text (a_expression: READABLE_STRING_GENERAL): like Current
			-- Set element's text content reactively.
			-- Example: x_text ("message")
		do
			set_alpine_attribute ("x-text", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-text") as v and then v.same_string (a_expression.to_string_32)
		end

	x_html (a_expression: READABLE_STRING_GENERAL): like Current
			-- Set element's HTML content reactively (use with caution).
			-- Example: x_html ("richContent")
		do
			set_alpine_attribute ("x-html", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-html") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Event Directives (x-on / @)

	x_on (a_event, a_expression: READABLE_STRING_GENERAL): like Current
			-- Attach event listener.
			-- Example: x_on ("click", "open = !open")
		require
			event_not_empty: not a_event.is_empty
		do
			set_alpine_attribute ("x-on:" + a_event.to_string_8, a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-on:" + a_event.to_string_8)
		end

	x_on_click (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle click event.
			-- Uses @ shorthand: @click="..."
		do
			set_alpine_attribute ("@click", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@click") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_click_prevent (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle click with preventDefault().
		do
			set_alpine_attribute ("@click.prevent", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@click.prevent") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_click_stop (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle click with stopPropagation().
		do
			set_alpine_attribute ("@click.stop", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@click.stop") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_click_outside (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle click outside this element.
			-- Useful for closing dropdowns/modals.
		do
			set_alpine_attribute ("@click.outside", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@click.outside") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_click_once (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle click only once.
		do
			set_alpine_attribute ("@click.once", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@click.once") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_submit (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle form submit event.
		do
			set_alpine_attribute ("@submit", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@submit") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_submit_prevent (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle form submit with preventDefault().
		do
			set_alpine_attribute ("@submit.prevent", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@submit.prevent") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_change (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle change event.
		do
			set_alpine_attribute ("@change", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@change") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_input (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle input event.
		do
			set_alpine_attribute ("@input", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@input") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_input_debounce (a_expression: READABLE_STRING_GENERAL; a_ms: INTEGER): like Current
			-- Handle input event with debounce.
			-- Example: x_on_input_debounce ("search()", 300)
		require
			positive_ms: a_ms > 0
		do
			set_alpine_attribute ("@input.debounce." + a_ms.out + "ms", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("@input.debounce." + a_ms.out + "ms")
		end

	x_on_focus (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle focus event.
		do
			set_alpine_attribute ("@focus", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@focus") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_blur (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle blur event.
		do
			set_alpine_attribute ("@blur", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@blur") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_mouseenter (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle mouseenter event.
		do
			set_alpine_attribute ("@mouseenter", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@mouseenter") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_mouseleave (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle mouseleave event.
		do
			set_alpine_attribute ("@mouseleave", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@mouseleave") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Keyboard Event Directives

	x_on_keydown (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle keydown event.
		do
			set_alpine_attribute ("@keydown", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_escape (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Escape key press.
		do
			set_alpine_attribute ("@keydown.escape", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.escape") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_enter (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Enter key press.
		do
			set_alpine_attribute ("@keydown.enter", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.enter") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_tab (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Tab key press.
		do
			set_alpine_attribute ("@keydown.tab", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.tab") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_arrow_up (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Arrow Up key press.
		do
			set_alpine_attribute ("@keydown.arrow-up", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.arrow-up") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_arrow_down (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Arrow Down key press.
		do
			set_alpine_attribute ("@keydown.arrow-down", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.arrow-down") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keydown_space (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Space key press.
		do
			set_alpine_attribute ("@keydown.space", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keydown.space") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keyup (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle keyup event.
		do
			set_alpine_attribute ("@keyup", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keyup") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keyup_escape (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Escape key release.
		do
			set_alpine_attribute ("@keyup.escape", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keyup.escape") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_keyup_enter (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle Enter key release.
		do
			set_alpine_attribute ("@keyup.enter", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@keyup.enter") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Window/Document Events

	x_on_window (a_event, a_expression: READABLE_STRING_GENERAL): like Current
			-- Listen for event on window object.
			-- Example: x_on_window ("resize", "handleResize()")
		require
			event_not_empty: not a_event.is_empty
		do
			set_alpine_attribute ("@" + a_event.to_string_8 + ".window", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("@" + a_event.to_string_8 + ".window")
		end

	x_on_document (a_event, a_expression: READABLE_STRING_GENERAL): like Current
			-- Listen for event on document object.
		require
			event_not_empty: not a_event.is_empty
		do
			set_alpine_attribute ("@" + a_event.to_string_8 + ".document", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("@" + a_event.to_string_8 + ".document")
		end

	x_on_scroll_window (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle window scroll event.
		do
			set_alpine_attribute ("@scroll.window", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@scroll.window") as v and then v.same_string (a_expression.to_string_32)
		end

	x_on_resize_window (a_expression: READABLE_STRING_GENERAL): like Current
			-- Handle window resize event.
		do
			set_alpine_attribute ("@resize.window", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("@resize.window") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Binding Directives (x-bind / :)

	x_bind (a_attribute, a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind any attribute to expression.
			-- Example: x_bind ("href", "url")
		require
			attribute_not_empty: not a_attribute.is_empty
		do
			set_alpine_attribute ("x-bind:" + a_attribute.to_string_8, a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-bind:" + a_attribute.to_string_8)
		end

	x_bind_class (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind class attribute (shorthand :class).
			-- Example: x_bind_class ("{ 'active': isActive, 'hidden': !isVisible }")
		do
			set_alpine_attribute (":class", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":class") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_style (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind style attribute (shorthand :style).
		do
			set_alpine_attribute (":style", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":style") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_disabled (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind disabled attribute.
		do
			set_alpine_attribute (":disabled", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":disabled") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_hidden (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind hidden attribute.
		do
			set_alpine_attribute (":hidden", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":hidden") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_href (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind href attribute.
		do
			set_alpine_attribute (":href", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":href") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_src (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind src attribute.
		do
			set_alpine_attribute (":src", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":src") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_value (a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind value attribute.
		do
			set_alpine_attribute (":value", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item (":value") as v and then v.same_string (a_expression.to_string_32)
		end

	x_bind_aria (a_aria_attr, a_expression: READABLE_STRING_GENERAL): like Current
			-- Bind ARIA attribute.
			-- Example: x_bind_aria ("expanded", "open")
		require
			aria_attr_not_empty: not a_aria_attr.is_empty
		do
			set_alpine_attribute (":aria-" + a_aria_attr.to_string_8, a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has (":aria-" + a_aria_attr.to_string_8)
		end

feature -- Alpine: Form Binding (x-model)

	x_model (a_property: READABLE_STRING_GENERAL): like Current
			-- Two-way bind form input to property.
			-- Example: x_model ("username")
		do
			set_alpine_attribute ("x-model", a_property)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-model") as v and then v.same_string (a_property.to_string_32)
		end

	x_model_lazy (a_property: READABLE_STRING_GENERAL): like Current
			-- Two-way bind, only sync on change (not input).
		do
			set_alpine_attribute ("x-model.lazy", a_property)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-model.lazy") as v and then v.same_string (a_property.to_string_32)
		end

	x_model_number (a_property: READABLE_STRING_GENERAL): like Current
			-- Two-way bind, cast to number.
		do
			set_alpine_attribute ("x-model.number", a_property)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-model.number") as v and then v.same_string (a_property.to_string_32)
		end

	x_model_debounce (a_property: READABLE_STRING_GENERAL; a_ms: INTEGER): like Current
			-- Two-way bind with debounce.
		require
			positive_ms: a_ms > 0
		do
			set_alpine_attribute ("x-model.debounce." + a_ms.out + "ms", a_property)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-model.debounce." + a_ms.out + "ms")
		end

	x_model_throttle (a_property: READABLE_STRING_GENERAL; a_ms: INTEGER): like Current
			-- Two-way bind with throttle.
		require
			positive_ms: a_ms > 0
		do
			set_alpine_attribute ("x-model.throttle." + a_ms.out + "ms", a_property)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-model.throttle." + a_ms.out + "ms")
		end

feature -- Alpine: Loop Directive

	x_for (a_expression: READABLE_STRING_GENERAL): like Current
			-- Loop over items.
			-- NOTE: Must be used on <template> elements.
			-- Example: x_for ("item in items") or x_for ("(item, index) in items")
		do
			set_alpine_attribute ("x-for", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-for") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Reference Directive

	x_ref (a_name: READABLE_STRING_GENERAL): like Current
			-- Name this element for $refs access.
			-- Example: x_ref ("input") then access via $refs.input
		require
			name_not_empty: not a_name.is_empty
		do
			set_alpine_attribute ("x-ref", a_name)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-ref") as v and then v.same_string (a_name.to_string_32)
		end

feature -- Alpine: Transition Directives

	x_transition: like Current
			-- Apply default enter/leave transitions.
		do
			attributes.force ("", "x-transition")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition")
		end

	x_transition_opacity: like Current
			-- Fade in/out transition.
		do
			attributes.force ("", "x-transition.opacity")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition.opacity")
		end

	x_transition_scale: like Current
			-- Scale transition.
		do
			attributes.force ("", "x-transition.scale")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition.scale")
		end

	x_transition_scale_origin (a_origin: READABLE_STRING_GENERAL): like Current
			-- Scale transition with custom origin.
			-- Example: x_transition_scale_origin ("top") for dropdown from top
		require
			origin_not_empty: not a_origin.is_empty
		do
			attributes.force ("", "x-transition.scale.origin." + a_origin.to_string_8)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition.scale.origin." + a_origin.to_string_8)
		end

	x_transition_duration (a_ms: INTEGER): like Current
			-- Set transition duration.
		require
			positive_ms: a_ms > 0
		do
			attributes.force ("", "x-transition.duration." + a_ms.out + "ms")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition.duration." + a_ms.out + "ms")
		end

	x_transition_delay (a_ms: INTEGER): like Current
			-- Set transition delay.
		require
			non_negative_ms: a_ms >= 0
		do
			attributes.force ("", "x-transition.delay." + a_ms.out + "ms")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-transition.delay." + a_ms.out + "ms")
		end

	x_transition_enter (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes during entire enter phase.
		do
			set_alpine_attribute ("x-transition:enter", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:enter") as v and then v.same_string (a_classes.to_string_32)
		end

	x_transition_enter_start (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes at start of enter.
		do
			set_alpine_attribute ("x-transition:enter-start", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:enter-start") as v and then v.same_string (a_classes.to_string_32)
		end

	x_transition_enter_end (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes at end of enter.
		do
			set_alpine_attribute ("x-transition:enter-end", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:enter-end") as v and then v.same_string (a_classes.to_string_32)
		end

	x_transition_leave (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes during entire leave phase.
		do
			set_alpine_attribute ("x-transition:leave", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:leave") as v and then v.same_string (a_classes.to_string_32)
		end

	x_transition_leave_start (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes at start of leave.
		do
			set_alpine_attribute ("x-transition:leave-start", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:leave-start") as v and then v.same_string (a_classes.to_string_32)
		end

	x_transition_leave_end (a_classes: READABLE_STRING_GENERAL): like Current
			-- Classes at end of leave.
		do
			set_alpine_attribute ("x-transition:leave-end", a_classes)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-transition:leave-end") as v and then v.same_string (a_classes.to_string_32)
		end

feature -- Alpine: Effect Directive

	x_effect (a_expression: READABLE_STRING_GENERAL): like Current
			-- Run side effect when dependencies change.
			-- Example: x_effect ("console.log(count)")
		do
			set_alpine_attribute ("x-effect", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-effect") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Ignore Directive

	x_ignore: like Current
			-- Prevent Alpine from processing this element and children.
		do
			attributes.force ("", "x-ignore")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-ignore")
		end

feature -- Alpine: Teleport Directive

	x_teleport (a_selector: READABLE_STRING_GENERAL): like Current
			-- Move element to another location in DOM.
			-- Example: x_teleport ("body") for modals
		require
			selector_not_empty: not a_selector.is_empty
		do
			set_alpine_attribute ("x-teleport", a_selector)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-teleport") as v and then v.same_string (a_selector.to_string_32)
		end

feature -- Alpine: ID Directive

	x_id (a_names: READABLE_STRING_GENERAL): like Current
			-- Generate unique IDs for accessibility.
			-- Example: x_id ("['dropdown-button', 'dropdown-menu']")
		do
			set_alpine_attribute ("x-id", a_names)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-id") as v and then v.same_string (a_names.to_string_32)
		end

feature -- Alpine: Plugin - Collapse

	x_collapse: like Current
			-- Smooth height transition (requires collapse plugin).
		do
			attributes.force ("", "x-collapse")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-collapse")
		end

	x_collapse_duration (a_ms: INTEGER): like Current
			-- Collapse with custom duration.
		require
			positive_ms: a_ms > 0
		do
			attributes.force ("", "x-collapse.duration." + a_ms.out + "ms")
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attributes.has ("x-collapse.duration." + a_ms.out + "ms")
		end

feature -- Alpine: Plugin - Focus/Trap

	x_trap (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trap focus inside element (requires focus plugin).
			-- Essential for accessible modals.
		do
			set_alpine_attribute ("x-trap", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-trap") as v and then v.same_string (a_expression.to_string_32)
		end

	x_trap_inert (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trap focus and make outside elements inert.
		do
			set_alpine_attribute ("x-trap.inert", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-trap.inert") as v and then v.same_string (a_expression.to_string_32)
		end

	x_trap_noscroll (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trap focus and prevent body scrolling.
		do
			set_alpine_attribute ("x-trap.noscroll", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-trap.noscroll") as v and then v.same_string (a_expression.to_string_32)
		end

feature -- Alpine: Plugin - Intersect

	x_intersect (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trigger when element enters viewport (requires intersect plugin).
		do
			set_alpine_attribute ("x-intersect", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-intersect") as v and then v.same_string (a_expression.to_string_32)
		end

	x_intersect_enter (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trigger only when entering viewport.
		do
			set_alpine_attribute ("x-intersect:enter", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-intersect:enter") as v and then v.same_string (a_expression.to_string_32)
		end

	x_intersect_leave (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trigger only when leaving viewport.
		do
			set_alpine_attribute ("x-intersect:leave", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-intersect:leave") as v and then v.same_string (a_expression.to_string_32)
		end

	x_intersect_once (a_expression: READABLE_STRING_GENERAL): like Current
			-- Trigger only once when entering viewport.
		do
			set_alpine_attribute ("x-intersect.once", a_expression)
			Result := Current
		ensure
			fluent_result: Result = Current
			attribute_set: attached attributes.item ("x-intersect.once") as v and then v.same_string (a_expression.to_string_32)
		end

feature {NONE} -- Implementation

	set_alpine_attribute (a_name: STRING; a_value: READABLE_STRING_GENERAL)
			-- Set an Alpine attribute.
		require
			name_not_empty: not a_name.is_empty
		do
			attributes.force (a_value.to_string_32, a_name)
		ensure
			attribute_set: attached attributes.item (a_name)
			value_matches: attached attributes.item (a_name) as v implies v.same_string (a_value.to_string_32)
		end

invariant
	-- ALPINE_ELEMENT inherits from HTMX_ELEMENT which provides attributes hash table
	-- Alpine directives are just attributes, so we inherit HTMX_ELEMENT's invariant

end
