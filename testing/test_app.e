note
	description: "Test application for SIMPLE_ALPINE"
	author: "Larry Rix"

class
	TEST_APP

create
	make

feature {NONE} -- Initialization

	make
			-- Run the tests.
		do
			print ("Running SIMPLE_ALPINE tests...%N%N")
			passed := 0
			failed := 0

			run_lib_tests
			run_factory_tests
			run_directives_tests

			print ("%N========================%N")
			print ("Results: " + passed.out + " passed, " + failed.out + " failed%N")

			if failed > 0 then
				print ("TESTS FAILED%N")
			else
				print ("ALL TESTS PASSED%N")
			end
		end

feature {NONE} -- Test Runners

	run_lib_tests
		do
			create lib_tests
			run_test (agent lib_tests.test_div_make, "test_div_make")
			run_test (agent lib_tests.test_div_to_html, "test_div_to_html")
		end

	run_factory_tests
		do
			create factory_tests
			run_test (agent factory_tests.test_toggle, "test_toggle")
			run_test (agent factory_tests.test_set_true, "test_set_true")
			run_test (agent factory_tests.test_set_false, "test_set_false")
			run_test (agent factory_tests.test_ternary, "test_ternary")
			run_test (agent factory_tests.test_class_if, "test_class_if")
			run_test (agent factory_tests.test_class_multi, "test_class_multi")
			run_test (agent factory_tests.test_data_bool, "test_data_bool")
			run_test (agent factory_tests.test_data_string, "test_data_string")
			run_test (agent factory_tests.test_data_int, "test_data_int")
			run_test (agent factory_tests.test_data_object, "test_data_object")
			run_test (agent factory_tests.test_refs, "test_refs")
			run_test (agent factory_tests.test_store, "test_store")
			run_test (agent factory_tests.test_dispatch, "test_dispatch")
			run_test (agent factory_tests.test_dispatch_with_data, "test_dispatch_with_data")
			run_test (agent factory_tests.test_dropdown_data, "test_dropdown_data")
			run_test (agent factory_tests.test_dropdown_toggle, "test_dropdown_toggle")
			run_test (agent factory_tests.test_tabs_data, "test_tabs_data")
			run_test (agent factory_tests.test_tabs_select, "test_tabs_select")
			run_test (agent factory_tests.test_tabs_is_active, "test_tabs_is_active")
			run_test (agent factory_tests.test_accordion_toggle, "test_accordion_toggle")
			run_test (agent factory_tests.test_counter_data, "test_counter_data")
			run_test (agent factory_tests.test_div_creation, "test_div_creation")
			run_test (agent factory_tests.test_button_text_creation, "test_button_text_creation")
			run_test (agent factory_tests.test_input_text_creation, "test_input_text_creation")
			run_test (agent factory_tests.test_template_creation, "test_template_creation")
		end

	run_directives_tests
		do
			create directives_tests
			-- x-data and x-init
			run_test (agent directives_tests.test_x_data_simple, "test_x_data_simple")
			run_test (agent directives_tests.test_x_data_empty, "test_x_data_empty")
			run_test (agent directives_tests.test_x_init, "test_x_init")
			-- Visibility
			run_test (agent directives_tests.test_x_show, "test_x_show")
			run_test (agent directives_tests.test_x_if, "test_x_if")
			run_test (agent directives_tests.test_x_cloak, "test_x_cloak")
			-- Content
			run_test (agent directives_tests.test_x_text, "test_x_text")
			run_test (agent directives_tests.test_x_html, "test_x_html")
			-- Events
			run_test (agent directives_tests.test_x_on_click, "test_x_on_click")
			run_test (agent directives_tests.test_x_on_click_prevent, "test_x_on_click_prevent")
			run_test (agent directives_tests.test_x_on_click_outside, "test_x_on_click_outside")
			run_test (agent directives_tests.test_x_on_submit_prevent, "test_x_on_submit_prevent")
			run_test (agent directives_tests.test_x_on_input_debounce, "test_x_on_input_debounce")
			run_test (agent directives_tests.test_x_on_keydown_escape, "test_x_on_keydown_escape")
			run_test (agent directives_tests.test_x_on_keydown_enter, "test_x_on_keydown_enter")
			-- Bindings
			run_test (agent directives_tests.test_x_bind_class, "test_x_bind_class")
			run_test (agent directives_tests.test_x_bind_style, "test_x_bind_style")
			run_test (agent directives_tests.test_x_bind_disabled, "test_x_bind_disabled")
			run_test (agent directives_tests.test_x_bind_aria, "test_x_bind_aria")
			-- Model
			run_test (agent directives_tests.test_x_model, "test_x_model")
			run_test (agent directives_tests.test_x_model_lazy, "test_x_model_lazy")
			run_test (agent directives_tests.test_x_model_debounce, "test_x_model_debounce")
			-- Iteration
			run_test (agent directives_tests.test_x_for, "test_x_for")
			-- Reference
			run_test (agent directives_tests.test_x_ref, "test_x_ref")
			-- Transitions
			run_test (agent directives_tests.test_x_transition, "test_x_transition")
			run_test (agent directives_tests.test_x_transition_opacity, "test_x_transition_opacity")
			run_test (agent directives_tests.test_x_transition_scale_origin, "test_x_transition_scale_origin")
			run_test (agent directives_tests.test_x_transition_duration, "test_x_transition_duration")
			-- Plugins
			run_test (agent directives_tests.test_x_collapse, "test_x_collapse")
			run_test (agent directives_tests.test_x_trap, "test_x_trap")
			run_test (agent directives_tests.test_x_intersect, "test_x_intersect")
			-- Integration
			run_test (agent directives_tests.test_alpine_and_htmx_together, "test_alpine_and_htmx_together")
			-- Additional events
			run_test (agent directives_tests.test_x_on_click_stop, "test_x_on_click_stop")
			run_test (agent directives_tests.test_x_on_click_once, "test_x_on_click_once")
			run_test (agent directives_tests.test_x_on_change, "test_x_on_change")
			run_test (agent directives_tests.test_x_on_input, "test_x_on_input")
			run_test (agent directives_tests.test_x_on_focus, "test_x_on_focus")
			run_test (agent directives_tests.test_x_on_blur, "test_x_on_blur")
			run_test (agent directives_tests.test_x_on_mouseenter, "test_x_on_mouseenter")
			run_test (agent directives_tests.test_x_on_mouseleave, "test_x_on_mouseleave")
			run_test (agent directives_tests.test_x_on_submit, "test_x_on_submit")
			run_test (agent directives_tests.test_x_on_keydown, "test_x_on_keydown")
			run_test (agent directives_tests.test_x_on_keydown_tab, "test_x_on_keydown_tab")
			run_test (agent directives_tests.test_x_on_keydown_arrow_up, "test_x_on_keydown_arrow_up")
			run_test (agent directives_tests.test_x_on_keydown_arrow_down, "test_x_on_keydown_arrow_down")
			run_test (agent directives_tests.test_x_on_keydown_space, "test_x_on_keydown_space")
			run_test (agent directives_tests.test_x_on_keyup, "test_x_on_keyup")
			run_test (agent directives_tests.test_x_on_keyup_escape, "test_x_on_keyup_escape")
			run_test (agent directives_tests.test_x_on_keyup_enter, "test_x_on_keyup_enter")
			run_test (agent directives_tests.test_x_on_window, "test_x_on_window")
			run_test (agent directives_tests.test_x_on_document, "test_x_on_document")
			run_test (agent directives_tests.test_x_on_scroll_window, "test_x_on_scroll_window")
			run_test (agent directives_tests.test_x_on_resize_window, "test_x_on_resize_window")
			-- Additional bindings
			run_test (agent directives_tests.test_x_bind, "test_x_bind")
			run_test (agent directives_tests.test_x_bind_hidden, "test_x_bind_hidden")
			run_test (agent directives_tests.test_x_bind_href, "test_x_bind_href")
			run_test (agent directives_tests.test_x_bind_src, "test_x_bind_src")
			run_test (agent directives_tests.test_x_bind_value, "test_x_bind_value")
			-- Additional model
			run_test (agent directives_tests.test_x_model_number, "test_x_model_number")
			run_test (agent directives_tests.test_x_model_throttle, "test_x_model_throttle")
			-- Additional transitions
			run_test (agent directives_tests.test_x_transition_scale, "test_x_transition_scale")
			run_test (agent directives_tests.test_x_transition_delay, "test_x_transition_delay")
			run_test (agent directives_tests.test_x_transition_enter, "test_x_transition_enter")
			run_test (agent directives_tests.test_x_transition_leave, "test_x_transition_leave")
			-- Advanced directives
			run_test (agent directives_tests.test_x_effect, "test_x_effect")
			run_test (agent directives_tests.test_x_ignore, "test_x_ignore")
			run_test (agent directives_tests.test_x_teleport, "test_x_teleport")
			run_test (agent directives_tests.test_x_id, "test_x_id")
			-- Additional plugins
			run_test (agent directives_tests.test_x_collapse_duration, "test_x_collapse_duration")
			run_test (agent directives_tests.test_x_trap_inert, "test_x_trap_inert")
			run_test (agent directives_tests.test_x_trap_noscroll, "test_x_trap_noscroll")
			run_test (agent directives_tests.test_x_intersect_enter, "test_x_intersect_enter")
			run_test (agent directives_tests.test_x_intersect_leave, "test_x_intersect_leave")
			run_test (agent directives_tests.test_x_intersect_once, "test_x_intersect_once")
			-- Edge case tests
			run_test (agent directives_tests.test_arrow_function_not_escaped, "test_arrow_function_not_escaped")
			run_test (agent directives_tests.test_logical_and_not_escaped, "test_logical_and_not_escaped")
			run_test (agent directives_tests.test_comparison_operators_not_escaped, "test_comparison_operators_not_escaped")
			run_test (agent directives_tests.test_less_than_not_escaped, "test_less_than_not_escaped")
		end

feature {NONE} -- Implementation

	lib_tests: LIB_TESTS
	factory_tests: TEST_ALPINE_FACTORY
	directives_tests: TEST_ALPINE_DIRECTIVES

	passed: INTEGER
	failed: INTEGER

	run_test (a_test: PROCEDURE; a_name: STRING)
			-- Run a single test and update counters.
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
				a_test.call (Void)
				print ("  PASS: " + a_name + "%N")
				passed := passed + 1
			end
		rescue
			print ("  FAIL: " + a_name + "%N")
			failed := failed + 1
			l_retried := True
			retry
		end

end
