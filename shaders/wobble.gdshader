shader_type canvas_item;

uniform float wave_amplitude : hint_range(0.0, 10.0) = 5.0; // Amplitude of the wobble
uniform float wave_frequency : hint_range(0.0, 10.0) = 3.0; // Frequency of the waves
uniform float wave_speed : hint_range(0.0, 10.0) = 1.0;      // Speed of the waves

void vertex() {
    // Calculate time-based distortion
    float time = TIME * wave_speed;

    // Add distortion to the vertex position
    // Use sine for a smooth wobble along the Y-axis (or X if desired)
    //if (VERTEX.x > 64.0) {
	//	VERTEX.y += sin(VERTEX.x * wave_frequency + time) * wave_amplitude;
   // 	VERTEX.x += cos(VERTEX.y * wave_frequency + time) * wave_amplitude;
	//}
}