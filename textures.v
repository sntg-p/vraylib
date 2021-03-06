module vraylib

// -------------------------------------------------
// 	Module - Textures
// -------------------------------------------------

// Image/Texture2D data loading/unloading/saving functions

// Load image from file into CPU memory (RAM)
[inline] pub fn load_image(fileName string) Image {
	return C.LoadImage(fileName.str)
}

// Load image from Color array data (RGBA - 32bit)
[inline] pub fn load_image_ex(pixel &Color, width, height int) Image {
	return C.LoadImageEx(pixel, width, height)

}

// Load image from raw data with parameters
[inline] pub fn load_image_proc(data voidptr, width, height, format int) Image {
	return C.LoadImagePro(data, width, height, format)
}

// Load image from RAW file data
[inline] pub fn load_image_raw(fileName string, width, height, format, headerSize int) Image {
	return C.LoadImageRaw(fileName.str, width, height, format, headerSize)
}

// Export image data to file
[inline] pub fn export_image(image Image, fileName string) {
	C.ExportImage(image, fileName.str)
}

// Export image as code file defining an array of bytes
[inline] pub fn export_image_as_code(image Image, fileName string) {
	C.ExportImageAsCode(image, fileName.str)
}

// Load texture from file into GPU memory (VRAM)
[inline] pub fn load_texture(fileName string) Texture2D {
	return C.LoadTexture(fileName.str)
}

// Load texture from image data
[inline] pub fn load_texture_from_image(image Image) Texture2D {
	return C.LoadTextureFromImage(image)
}

// Load cubemap from image, multiple image cubemap layouts supported
// [inline] pub fn load_texture_cubemap(image Image, layoutType int) TextureCubemap {
// 	return C.TextureCubemap(image, layoutType)
// }

// Load texture for rendering (framebuffer)
[inline] pub fn load_render_texture(width, height int) RenderTexture2D {
	return C.LoadRenderTexture(width, height)
}

// Unload image from CPU memory (RAM)
[inline] pub fn unload_image(image Image) {
	C.UnloadImage(image)
}

// Unload texture from GPU memory (VRAM)
[inline] pub fn unload_texture(texture Texture2D) {
	C.UnloadTexture(texture)
}

// Unload render texture from GPU memory (VRAM)
[inline] pub fn unload_render_texture(target RenderTexture2D) {
	C.UnloadRenderTexture(target)
}

// Color *GetImageData(Image image);                                                                   // Get pixel data from image as a Color struct array
// Vector4 *GetImageDataNormalized(Image image);                                                       // Get pixel data from image as Vector4 array (float normalized)

// Get pixel data size in bytes (image or texture)
[inline] pub fn get_pixel_data_size(width, height, format int) int {
	return C.GetPixelDataSize(width, height, format)
}

// Get pixel data from GPU texture and return an Image
[inline] pub fn get_texture_data(texture Texture2D) Image {
	return C.GetTextureData(texture)
}

// Get pixel data from screen buffer and return an Image (screenshot)
[inline] pub fn get_screen_data() Image {
	return C.GetScreenData()
}

// Update GPU texture with new data
[inline] pub fn update_texture(texture Texture2D, pixels voidptr) {
	C.UpdateTexture(texture, pixels)
}


////////////////////////////////////////////////////////////////////////////////

// Texture2D configuration functions
//

// Generate GPU mipmaps for a texture
[inline] pub fn gen_texture_mipmaps(texture &Texture2D) {
	C.GenTextureMipmaps(texture)
}

// Set texture scaling filter mode
[inline] pub fn set_texture_filter(texture Texture2D, filterMode int) {
	C.SetTextureFilter(texture, filterMode)
}

// Set texture wrapping mode
[inline] pub fn set_texture_wrap(texture Texture2D, wrapMode int) {
	C.SetTextureWrap(texture, wrapMode)
}

// Texture2D drawing functions
//

// Draw a Texture2D
[inline] pub fn draw_texture(texture Texture2D, posX, posY int, tint Color) {
	C.DrawTexture(texture, posX, posY, tint)
}

// Draw a Texture2D with position defined as Vector2
[inline] pub fn draw_texture_v(texture Texture2D, position Vector2, tint Color) {
	C.DrawTextureV(texture, position, tint)
}

// Draw a Texture2D with extended parameters
[inline] pub fn draw_texture_ex(texture Texture2D, position Vector2, rotation, scale f32, tint Color) {
	C.DrawTextureEx(texture, position, rotation, scale, tint)
}

// Draw a part of a texture defined by a rectangle
[inline] pub fn draw_texture_rec(texture Texture2D, sourceRec Rectangle, position Vector2, tint Color) {
	C.DrawTextureRec(texture, sourceRec, position, tint)
}

// Draw texture quad with tiling and offset parameters
[inline] pub fn draw_texture_quad(texture Texture2D, tiling, offset Vector2, quad Rectangle, tint Color) {
	C.DrawTextureQuad(texture, tiling, offset, quad, tint)
}

// Draw a part of a texture defined by a rectangle with 'pro' parameters
[inline] pub fn draw_texture_pro(texture Texture2D, sourceRec, destRec Rectangle, origin Vector2, rotation f32, tint Color) {
	C.DrawTexturePro(texture, sourceRec, destRec, origin, rotation, tint)
}

// Draws a texture (or part of it) that stretches or shrinks nicely
[inline] pub fn draw_texture_n_patch(texture Texture2D, nPatchInfo NPatchInfo, destRec Rectangle, origin Vector2, rotation f32, tint Color) {
	C.DrawTextureNPatch(texture, nPatchInfo, destRec, origin, rotation, tint)
}

