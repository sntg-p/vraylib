module main

import MajorHard.vraylib

const (
	screenWidth = 800
	screenHeight = 450
)


fn main() {
	vraylib.init_window(screenWidth, screenHeight, "vraylib [core] example - mouse input")
	defer { vraylib.close_window() }

	mut ball_position := Vector2{ x: -100, y: -100 }
	mut ball_color := vraylib.darkblue

	vraylib.set_target_fps(60)

	for {
		if vraylib.window_should_close() {
			break
		}

		ball_position = vraylib.get_mouse_position()

		if (vraylib.is_mouse_button_pressed(vraylib.mouse_left_button)) {
			ball_color = vraylib.maroon
		}
		if (vraylib.is_mouse_button_pressed(vraylib.mouse_middle_button)) {
			ball_color = vraylib.lime
		}
		if (vraylib.is_mouse_button_pressed(vraylib.mouse_right_button)) {
			ball_color = vraylib.darkblue
		}



		{
			vraylib.begin_drawing()
			defer {  vraylib.end_drawing() }

			vraylib.clear_background(vraylib.raywhite)
			vraylib.draw_circle_v(ball_position, 50, ball_color)
			vraylib.draw_text("move ball with mouse and click mouse button to change color", 10, 10, 20, vraylib.darkgray)
		}
	}

}
