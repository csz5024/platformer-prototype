shader_type canvas_item;

uniform float tile_count : hint_range(1.0, 20.0) = 3.0;
 
void fragment() {
    vec2 uv = UV * vec2(tile_count, 1.0);
    
    // Check if we're in an odd tile (should be mirrored)
    if (floor(uv.x) == 0.0) {
		uv.x = fract(uv.x);
	} else if (mod(floor(uv.x), 2.0) == 0.0) {
        uv.x = 1.0 - fract(uv.x);  // Flip horizontally
    } else {
        uv.x = fract(uv.x);
    }
    
    COLOR = texture(TEXTURE, uv);
}
