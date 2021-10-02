shader_type canvas_item;
uniform float amount;

void fragment() {
    COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
    vec2 offset = vec2(0.01, 0.0);
    vec4 left = texture(SCREEN_TEXTURE, SCREEN_UV - offset);
    vec4 right = texture(SCREEN_TEXTURE, SCREEN_UV + offset);
    left.r *= left.r;
    right.b *= right.b;
    COLOR.g *= COLOR.g;
    COLOR = (left * 0.3) + (right * 0.3) + (COLOR * 0.4);
    COLOR.g *= COLOR.g;
	
	COLOR.a = amount;
}