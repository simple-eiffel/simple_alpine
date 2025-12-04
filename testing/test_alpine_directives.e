note
	description: "Tests for Alpine.js directive generation"
	author: "Larry Rix with Claude"

class
	TEST_ALPINE_DIRECTIVES

inherit
	TEST_SET_BASE

feature -- Test: x-data

	test_x_data_simple
			-- Test basic x-data attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_data ("{ open: false }").do_nothing
			assert_has_substring ("x-data attribute present", l_div.to_html_8, "x-data=")
			assert_has_substring ("x-data value correct", l_div.to_html_8, "{ open: false }")
		end

	test_x_data_empty
			-- Test empty x-data attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_data_empty.do_nothing
			assert_has_substring ("x-data attribute present", l_div.to_html_8, "x-data")
		end

	test_x_init
			-- Test x-init attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_init ("console.log('ready')").do_nothing
			assert_has_substring ("x-init present", l_div.to_html_8, "x-init=")
		end

feature -- Test: x-show / x-if

	test_x_show
			-- Test x-show attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_show ("isVisible").do_nothing
			assert_has_substring ("x-show present", l_div.to_html_8, "x-show=")
			assert_has_substring ("x-show value", l_div.to_html_8, "isVisible")
		end

	test_x_if
			-- Test x-if attribute (typically on template).
		local
			l_template: ALPINE_TEMPLATE
		do
			create l_template.make
			l_template.x_if ("items.length > 0").do_nothing
			assert_has_substring ("x-if present", l_template.to_html_8, "x-if=")
		end

	test_x_cloak
			-- Test x-cloak attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_cloak.do_nothing
			assert_has_substring ("x-cloak present", l_div.to_html_8, "x-cloak")
		end

feature -- Test: x-text / x-html

	test_x_text
			-- Test x-text attribute.
		local
			l_span: ALPINE_SPAN
		do
			create l_span.make
			l_span.x_text ("message").do_nothing
			assert_has_substring ("x-text present", l_span.to_html_8, "x-text=")
			assert_has_substring ("x-text value", l_span.to_html_8, "message")
		end

	test_x_html
			-- Test x-html attribute.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_html ("richContent").do_nothing
			assert_has_substring ("x-html present", l_div.to_html_8, "x-html=")
		end

feature -- Test: x-on events

	test_x_on_click
			-- Test @click shorthand.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_on_click ("open = !open").do_nothing
			assert_has_substring ("@click present", l_btn.to_html_8, "@click=")
		end

	test_x_on_click_prevent
			-- Test @click.prevent modifier.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_on_click_prevent ("handleClick()").do_nothing
			assert_has_substring ("@click.prevent present", l_btn.to_html_8, "@click.prevent=")
		end

	test_x_on_click_outside
			-- Test @click.outside modifier.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_click_outside ("open = false").do_nothing
			assert_has_substring ("@click.outside present", l_div.to_html_8, "@click.outside=")
		end

	test_x_on_submit_prevent
			-- Test @submit.prevent.
		local
			l_form: ALPINE_FORM
		do
			create l_form.make
			l_form.x_on_submit_prevent ("handleSubmit()").do_nothing
			assert_has_substring ("@submit.prevent present", l_form.to_html_8, "@submit.prevent=")
		end

	test_x_on_input_debounce
			-- Test @input.debounce modifier.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_input_debounce ("search()", 300).do_nothing
			assert_has_substring ("@input.debounce present", l_input.to_html_8, "@input.debounce.300ms=")
		end

feature -- Test: Keyboard events

	test_x_on_keydown_escape
			-- Test @keydown.escape.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_keydown_escape ("open = false").do_nothing
			assert_has_substring ("@keydown.escape present", l_div.to_html_8, "@keydown.escape=")
		end

	test_x_on_keydown_enter
			-- Test @keydown.enter.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_keydown_enter ("submit()").do_nothing
			assert_has_substring ("@keydown.enter present", l_input.to_html_8, "@keydown.enter=")
		end

feature -- Test: x-bind

	test_x_bind_class
			-- Test :class shorthand.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_bind_class ("{ 'active': isActive }").do_nothing
			assert_has_substring (":class present", l_div.to_html_8, ":class=")
		end

	test_x_bind_style
			-- Test :style shorthand.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_bind_style ("{ color: textColor }").do_nothing
			assert_has_substring (":style present", l_div.to_html_8, ":style=")
		end

	test_x_bind_disabled
			-- Test :disabled binding.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_bind_disabled ("isLoading").do_nothing
			assert_has_substring (":disabled present", l_btn.to_html_8, ":disabled=")
		end

	test_x_bind_aria
			-- Test :aria-* binding.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_bind_aria ("expanded", "open").do_nothing
			assert_has_substring (":aria-expanded present", l_btn.to_html_8, ":aria-expanded=")
		end

feature -- Test: x-model

	test_x_model
			-- Test basic x-model.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_model ("username").do_nothing
			assert_has_substring ("x-model present", l_input.to_html_8, "x-model=")
			assert_has_substring ("x-model value", l_input.to_html_8, "username")
		end

	test_x_model_lazy
			-- Test x-model.lazy modifier.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_model_lazy ("email").do_nothing
			assert_has_substring ("x-model.lazy present", l_input.to_html_8, "x-model.lazy=")
		end

	test_x_model_debounce
			-- Test x-model.debounce modifier.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_model_debounce ("search", 500).do_nothing
			assert_has_substring ("x-model.debounce present", l_input.to_html_8, "x-model.debounce.500ms=")
		end

feature -- Test: x-for

	test_x_for
			-- Test x-for loop directive.
		local
			l_template: ALPINE_TEMPLATE
		do
			create l_template.make
			l_template.x_for ("item in items").do_nothing
			assert_has_substring ("x-for present", l_template.to_html_8, "x-for=")
			assert_has_substring ("x-for value", l_template.to_html_8, "item in items")
		end

feature -- Test: x-ref

	test_x_ref
			-- Test x-ref directive.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_ref ("searchInput").do_nothing
			assert_has_substring ("x-ref present", l_input.to_html_8, "x-ref=")
			assert_has_substring ("x-ref value", l_input.to_html_8, "searchInput")
		end

feature -- Test: Transitions

	test_x_transition
			-- Test basic x-transition.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_show ("open").x_transition.do_nothing
			assert_has_substring ("x-transition present", l_div.to_html_8, "x-transition")
		end

	test_x_transition_opacity
			-- Test x-transition.opacity.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_show ("open").x_transition_opacity.do_nothing
			assert_has_substring ("x-transition.opacity present", l_div.to_html_8, "x-transition.opacity")
		end

	test_x_transition_scale_origin
			-- Test x-transition.scale.origin.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_scale_origin ("top").do_nothing
			assert_has_substring ("x-transition.scale.origin.top present", l_div.to_html_8, "x-transition.scale.origin.top")
		end

	test_x_transition_duration
			-- Test x-transition.duration.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_duration (200).do_nothing
			assert_has_substring ("x-transition.duration present", l_div.to_html_8, "x-transition.duration.200ms")
		end

feature -- Test: Plugins

	test_x_collapse
			-- Test x-collapse plugin directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_show ("open").x_collapse.do_nothing
			assert_has_substring ("x-collapse present", l_div.to_html_8, "x-collapse")
		end

	test_x_trap
			-- Test x-trap plugin directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_trap ("open").do_nothing
			assert_has_substring ("x-trap present", l_div.to_html_8, "x-trap=")
		end

	test_x_intersect
			-- Test x-intersect plugin directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_intersect ("shown = true").do_nothing
			assert_has_substring ("x-intersect present", l_div.to_html_8, "x-intersect=")
		end

feature -- Test: Combined with HTMX

	test_alpine_and_htmx_together
			-- Test Alpine and HTMX attributes on same element.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_data ("{ loading: false }")
			    .x_on_click ("loading = true")
			    .x_bind_disabled ("loading")
			    .hx_post ("/api/submit")
			    .hx_target ("#result")
			    .text ("Submit").do_nothing
			-- Verify Alpine attributes
			assert_has_substring ("x-data present", l_btn.to_html_8, "x-data=")
			assert_has_substring ("@click present", l_btn.to_html_8, "@click=")
			assert_has_substring (":disabled present", l_btn.to_html_8, ":disabled=")
			-- Verify HTMX attributes
			assert_has_substring ("hx-post present", l_btn.to_html_8, "hx-post=")
			assert_has_substring ("hx-target present", l_btn.to_html_8, "hx-target=")
		end

feature -- Test: Additional Event Modifiers

	test_x_on_click_stop
			-- Test @click.stop modifier.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_on_click_stop ("handleClick()").do_nothing
			assert_has_substring ("@click.stop present", l_btn.to_html_8, "@click.stop=")
		end

	test_x_on_click_once
			-- Test @click.once modifier.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_on_click_once ("initialize()").do_nothing
			assert_has_substring ("@click.once present", l_btn.to_html_8, "@click.once=")
		end

	test_x_on_change
			-- Test @change event.
		local
			l_select: ALPINE_SELECT
		do
			create l_select.make
			l_select.x_on_change ("updateSelection()").do_nothing
			assert_has_substring ("@change present", l_select.to_html_8, "@change=")
		end

	test_x_on_input
			-- Test @input event.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_input ("handleInput()").do_nothing
			assert_has_substring ("@input present", l_input.to_html_8, "@input=")
		end

	test_x_on_focus
			-- Test @focus event.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_focus ("focused = true").do_nothing
			assert_has_substring ("@focus present", l_input.to_html_8, "@focus=")
		end

	test_x_on_blur
			-- Test @blur event.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_blur ("focused = false").do_nothing
			assert_has_substring ("@blur present", l_input.to_html_8, "@blur=")
		end

	test_x_on_mouseenter
			-- Test @mouseenter event.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_mouseenter ("hovering = true").do_nothing
			assert_has_substring ("@mouseenter present", l_div.to_html_8, "@mouseenter=")
		end

	test_x_on_mouseleave
			-- Test @mouseleave event.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_mouseleave ("hovering = false").do_nothing
			assert_has_substring ("@mouseleave present", l_div.to_html_8, "@mouseleave=")
		end

	test_x_on_submit
			-- Test @submit event.
		local
			l_form: ALPINE_FORM
		do
			create l_form.make
			l_form.x_on_submit ("handleSubmit()").do_nothing
			assert_has_substring ("@submit present", l_form.to_html_8, "@submit=")
		end

feature -- Test: Additional Keyboard Events

	test_x_on_keydown
			-- Test @keydown event.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_keydown ("handleKey($event)").do_nothing
			assert_has_substring ("@keydown present", l_input.to_html_8, "@keydown=")
		end

	test_x_on_keydown_tab
			-- Test @keydown.tab.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_keydown_tab ("handleTab()").do_nothing
			assert_has_substring ("@keydown.tab present", l_input.to_html_8, "@keydown.tab=")
		end

	test_x_on_keydown_arrow_up
			-- Test @keydown.arrow-up.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_keydown_arrow_up ("selectPrevious()").do_nothing
			assert_has_substring ("@keydown.arrow-up present", l_div.to_html_8, "@keydown.arrow-up=")
		end

	test_x_on_keydown_arrow_down
			-- Test @keydown.arrow-down.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_keydown_arrow_down ("selectNext()").do_nothing
			assert_has_substring ("@keydown.arrow-down present", l_div.to_html_8, "@keydown.arrow-down=")
		end

	test_x_on_keydown_space
			-- Test @keydown.space.
		local
			l_btn: ALPINE_BUTTON
		do
			create l_btn.make
			l_btn.x_on_keydown_space ("toggle()").do_nothing
			assert_has_substring ("@keydown.space present", l_btn.to_html_8, "@keydown.space=")
		end

	test_x_on_keyup
			-- Test @keyup event.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_keyup ("handleKeyUp()").do_nothing
			assert_has_substring ("@keyup present", l_input.to_html_8, "@keyup=")
		end

	test_x_on_keyup_escape
			-- Test @keyup.escape.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_keyup_escape ("cancel()").do_nothing
			assert_has_substring ("@keyup.escape present", l_div.to_html_8, "@keyup.escape=")
		end

	test_x_on_keyup_enter
			-- Test @keyup.enter.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_on_keyup_enter ("confirm()").do_nothing
			assert_has_substring ("@keyup.enter present", l_input.to_html_8, "@keyup.enter=")
		end

feature -- Test: Window/Document Events

	test_x_on_window
			-- Test window event listener.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_window ("resize", "handleResize()").do_nothing
			assert_has_substring ("@resize.window present", l_div.to_html_8, "@resize.window=")
		end

	test_x_on_document
			-- Test document event listener.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_document ("click", "handleDocClick()").do_nothing
			assert_has_substring ("@click.document present", l_div.to_html_8, "@click.document=")
		end

	test_x_on_scroll_window
			-- Test window scroll event.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_scroll_window ("handleScroll()").do_nothing
			assert_has_substring ("@scroll.window present", l_div.to_html_8, "@scroll.window=")
		end

	test_x_on_resize_window
			-- Test window resize event.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_on_resize_window ("updateLayout()").do_nothing
			assert_has_substring ("@resize.window present", l_div.to_html_8, "@resize.window=")
		end

feature -- Test: Additional Binding

	test_x_bind
			-- Test generic x-bind.
		local
			l_a: ALPINE_A
		do
			create l_a.make
			l_a.x_bind ("href", "linkUrl").do_nothing
			assert_has_substring ("x-bind:href present", l_a.to_html_8, "x-bind:href=")
		end

	test_x_bind_hidden
			-- Test :hidden binding.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_bind_hidden ("isHidden").do_nothing
			assert_has_substring (":hidden present", l_div.to_html_8, ":hidden=")
		end

	test_x_bind_href
			-- Test :href binding.
		local
			l_a: ALPINE_A
		do
			create l_a.make
			l_a.x_bind_href ("url").do_nothing
			assert_has_substring (":href present", l_a.to_html_8, ":href=")
		end

	test_x_bind_src
			-- Test :src binding.
		local
			l_img: ALPINE_IMG
		do
			create l_img.make
			l_img.x_bind_src ("imageUrl").do_nothing
			assert_has_substring (":src present", l_img.to_html_8, ":src=")
		end

	test_x_bind_value
			-- Test :value binding.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_bind_value ("inputValue").do_nothing
			assert_has_substring (":value present", l_input.to_html_8, ":value=")
		end

feature -- Test: Additional x-model

	test_x_model_number
			-- Test x-model.number modifier.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_model_number ("quantity").do_nothing
			assert_has_substring ("x-model.number present", l_input.to_html_8, "x-model.number=")
		end

	test_x_model_throttle
			-- Test x-model.throttle modifier.
		local
			l_input: ALPINE_INPUT
		do
			create l_input.make
			l_input.x_model_throttle ("search", 200).do_nothing
			assert_has_substring ("x-model.throttle present", l_input.to_html_8, "x-model.throttle.200ms=")
		end

feature -- Test: Additional Transitions

	test_x_transition_scale
			-- Test x-transition.scale.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_scale.do_nothing
			assert_has_substring ("x-transition.scale present", l_div.to_html_8, "x-transition.scale")
		end

	test_x_transition_delay
			-- Test x-transition.delay.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_delay (100).do_nothing
			assert_has_substring ("x-transition.delay present", l_div.to_html_8, "x-transition.delay.100ms")
		end

	test_x_transition_enter
			-- Test x-transition:enter.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_enter ("transition ease-out duration-300").do_nothing
			assert_has_substring ("x-transition:enter present", l_div.to_html_8, "x-transition:enter=")
		end

	test_x_transition_leave
			-- Test x-transition:leave.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_transition_leave ("transition ease-in duration-200").do_nothing
			assert_has_substring ("x-transition:leave present", l_div.to_html_8, "x-transition:leave=")
		end

feature -- Test: Other Directives

	test_x_effect
			-- Test x-effect directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_effect ("console.log(count)").do_nothing
			assert_has_substring ("x-effect present", l_div.to_html_8, "x-effect=")
		end

	test_x_ignore
			-- Test x-ignore directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_ignore.do_nothing
			assert_has_substring ("x-ignore present", l_div.to_html_8, "x-ignore")
		end

	test_x_teleport
			-- Test x-teleport directive.
		local
			l_template: ALPINE_TEMPLATE
		do
			create l_template.make
			l_template.x_teleport ("body").do_nothing
			assert_has_substring ("x-teleport present", l_template.to_html_8, "x-teleport=")
		end

	test_x_id
			-- Test x-id directive.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_id ("['dropdown-button', 'dropdown-menu']").do_nothing
			assert_has_substring ("x-id present", l_div.to_html_8, "x-id=")
		end

feature -- Test: Additional Plugin Directives

	test_x_collapse_duration
			-- Test x-collapse.duration.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_collapse_duration (500).do_nothing
			assert_has_substring ("x-collapse.duration present", l_div.to_html_8, "x-collapse.duration.500ms")
		end

	test_x_trap_inert
			-- Test x-trap.inert.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_trap_inert ("open").do_nothing
			assert_has_substring ("x-trap.inert present", l_div.to_html_8, "x-trap.inert=")
		end

	test_x_trap_noscroll
			-- Test x-trap.noscroll.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_trap_noscroll ("open").do_nothing
			assert_has_substring ("x-trap.noscroll present", l_div.to_html_8, "x-trap.noscroll=")
		end

	test_x_intersect_enter
			-- Test x-intersect:enter.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_intersect_enter ("animateIn()").do_nothing
			assert_has_substring ("x-intersect:enter present", l_div.to_html_8, "x-intersect:enter=")
		end

	test_x_intersect_leave
			-- Test x-intersect:leave.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_intersect_leave ("animateOut()").do_nothing
			assert_has_substring ("x-intersect:leave present", l_div.to_html_8, "x-intersect:leave=")
		end

	test_x_intersect_once
			-- Test x-intersect.once.
		local
			l_div: ALPINE_DIV
		do
			create l_div.make
			l_div.x_intersect_once ("loadOnce()").do_nothing
			assert_has_substring ("x-intersect.once present", l_div.to_html_8, "x-intersect.once=")
		end

feature {NONE} -- Implementation

	assert_has_substring (a_tag: STRING; a_string, a_substring: STRING)
			-- Assert that a_string contains a_substring.
		do
			assert (a_tag, a_string.has_substring (a_substring))
		end

end
