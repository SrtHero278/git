package bindings.freetype;

import cpp.ConstCharStar;
import cpp.RawPointer;
import bindings.freetype.FreetypeBitmap;
import bindings.freetype.FreetypeGlyph;

typedef FTErr = Int;

@:include("freetype/fttypes.h")
@:native("FT_Generic")
extern class FTGeneric {}

@:include("freetype/freetype.h")
@:native("FT_LibraryRec_")
extern class FTLibraryRec {}

typedef FTLibrary = RawPointer<FTLibraryRec>;

@:include("freetype/ftimage.h")
@:native("FT_Vector")
@:structAccess
extern class FTVector {
    @:native("x")
    var x:cpp.UInt64;
    @:native("y")
    var y:cpp.UInt64;
}

@:include("freetype/fttypes.h")
@:native("FT_Matrix")
extern class FTMatrix {
    @:native("xx")
    var xx:cpp.UInt64;
    @:native("xy")
    var xy:cpp.UInt64;
    @:native("yx")
    var yx:cpp.UInt64;
    @:native("yy")
    var yy:cpp.UInt64;
}

@:include("freetype/ftimage.h")
@:native("FT_BBox")
extern class FTBBox {
    @:native("xMin")
    var xMin:cpp.UInt64;
    @:native("yMin")
    var yMin:cpp.UInt64;
    @:native("xMax")
    var xMax:cpp.UInt64;
    @:native("yMax")
    var yMax:cpp.UInt64;
}

@:include("freetype/freetype.h")
@:native("FT_Size_Metrics")
extern class FTSizeMetrics {
    @:native("x_ppem")
    var xPpem:cpp.UInt16;
    @:native("y_ppem")
    var yPpem:cpp.UInt16;

    @:native("x_scale")
    var xScale:cpp.UInt64;
    @:native("y_scale")
    var yScale:cpp.UInt64;

    @:native("ascender")
    var ascender:cpp.Int64;
    @:native("descender")
    var descender:cpp.Int64;
    @:native("height")
    var height:cpp.Int64;
    @:native("max_advance")
    var maxAdvance:cpp.Int64;
}

@:include("freetype/fttypes.h")
@:native("FT_Size_Internal")
extern class FTSizeInternal {}

@:include("freetype/freetype.h")
@:native("FT_Size")
extern class FTSize {
    @:native("face")
    var face:FTFace;
    @:native("generic")
    var generic:FTGeneric;
    @:native("metrics")
    var metrics:FTSizeMetrics;
    @:native("internal")
    var internal:FTSizeInternal;
}

@:include("freetype/freetype.h")
@:native("FT_FaceRec_")
@:structAccess
extern class FTFaceRec {
    @:native("num_faces")
    var numFaces:cpp.Int64;
    @:native("face_index")
    var faceIndex:cpp.Int64;

    @:native("face_flags")
    var faceFlags:cpp.Int64;
    @:native("style_flags")
    var styleFlags:cpp.Int64;

    @:native("num_glyphs")
    var numGlyphs:cpp.Int64;

    @:native("family_name")
    var familyName:RawPointer<cpp.Char>;
    @:native("style_name")
    var styleName:RawPointer<cpp.Char>;

    @:native("num_fixed_sizes")
    var numFixedSizes:Int;
    @:native("available_sizes")
    var availableAizes:RawPointer<FTBitmapSize>;

    @:native("num_charmaps")
    var numCharmaps:Int;
    @:native("charmaps")
    var charmaps:RawPointer<FTCharMap>;

    @:native("generic")
    var generic:FTGeneric;

    @:native("bbox")
    var bbox:FTBBox;

    @:native("units_per_EM")
    var unitsPerEM:cpp.UInt16;
    @:native("ascender")
    var ascender:cpp.Int16;
    @:native("descender")
    var descender:cpp.Int16;
    @:native("height")
    var height:cpp.Int16;

    @:native("max_advance_width")
    var maxAdvanceWidth:cpp.Int16;
    @:native("max_advance_height")
    var maxAdvanceHeight:cpp.Int16;

    @:native("underline_position")
    var underlinePosition:cpp.Int16;
    @:native("underline_thickness")
    var underlineThickness:cpp.Int16;

    @:native("glyph")
    var glyph:FTGlyphSlot;
    @:native("size")
    var size:FTSize;
    @:native("charmap")
    var charmap:FTCharMap;
}
typedef FTFace = RawPointer<FTFaceRec>;

@:include("freetype/ftimage.h")
@:native("FT_Outline")
extern class FTOutline {
    @:native("n_contours")
    var numContours:cpp.Int16;
    @:native("n_points")
    var numPoints:cpp.Int16;

    @:native("points")
    var points:RawPointer<FTVector>;
    @:native("tags")
    var tags:cpp.CastCharStar;
    @:native("contours")
    var contours:RawPointer<cpp.Int16>;

    @:native("flags")
    var flags:Int;
}

@:include("freetype/freetype.h")
@:native("FT_Size_Request_Type")
extern enum abstract FTSizeRequestType(cpp.UInt32) {
    @:native("FT_SIZE_REQUEST_TYPE_NOMINAL")
    var NOMINAL;
    @:native("FT_SIZE_REQUEST_TYPE_REAL_DIM")
    var REAL_DIM;
    @:native("FT_SIZE_REQUEST_TYPE_BBOX")
    var BBOX;
    @:native("FT_SIZE_REQUEST_TYPE_CELL")
    var CELL;
    @:native("FT_SIZE_REQUEST_TYPE_SCALES")
    var SCALES;
    @:native("FT_SIZE_REQUEST_TYPE_MAX")
    var MAX;
}

@:include("freetype/freetype.h")
@:native("FT_Size_Request")
extern class FTSizeRequest {
    @:native("type")
    var type:FTSizeRequestType;
    @:native("width")
    var width:cpp.Int64;
    @:native("height")
    var height:cpp.Int64;
    @:native("horiResolution")
    var horiResolution:cpp.UInt32;
    @:native("vertResolution")
    var vertResolution:cpp.UInt32;
}

@:include("freetype/freetype.h")
@:native("FT_Render_Mode")
extern enum abstract FTRenderMode(cpp.UInt32) to cpp.UInt32 {
    @:native("FT_RENDER_MODE_NORMAL")
    var NORMAL;
    @:native("FT_RENDER_MODE_LIGHT")
    var LIGHT;
    @:native("FT_RENDER_MODE_MONO")
    var MONO;
    @:native("FT_RENDER_MODE_LCD")
    var LCD;
    @:native("FT_RENDER_MODE_LCD_V")
    var LCD_V;
    @:native("FT_RENDER_MODE_SDF")
    var SDF;
    @:native("FT_RENDER_MODE_MAX")
    var MAX;
}

@:include("freetype/freetype.h")
@:native("FT_CharMap")
extern class FTCharMap {
    @:native("face")
    var face:FTFace;
    // @:native("encoding")
    // var encoding:FreetypeEncoding;
    @:native("platformID")
    var platformID:cpp.UInt16;
    @:native("encodingID")
    var encodingID:cpp.UInt16;
}

@:include("freetype/freetype.h")
@:native("FT_Parameter")
extern class FTParameter {
    @:native("tag")
    var tag:cpp.UInt64;
    @:native("data")
    var data:Any;
}

@:include("freetype/freetype.h")
extern class Freetype {
	@:native("FT_LOAD_DEFAULT")
	static final LOAD_DEFAULT:cpp.UInt32;
	@:native("FT_LOAD_NO_SCALE")
	static final LOAD_NO_SCALE:cpp.UInt32;
	@:native("FT_LOAD_NO_HINTING")
	static final LOAD_NO_HINTING:cpp.UInt32;
	@:native("FT_LOAD_RENDER")
	static final LOAD_RENDER:cpp.UInt32;
	@:native("FT_LOAD_NO_BITMAP")
	static final LOAD_NO_BITMAP:cpp.UInt32;
	@:native("FT_LOAD_VERTICAL_LAYOUT")
	static final LOAD_VERTICAL_LAYOUT:cpp.UInt32;
	@:native("FT_LOAD_FORCE_AUTOHINT")
	static final LOAD_FORCE_AUTOHINT:cpp.UInt32;
	@:native("FT_LOAD_CROP_BITMAP")
	static final LOAD_CROP_BITMAP:cpp.UInt32;
	@:native("FT_LOAD_PEDANTIC")
	static final LOAD_PEDANTIC:cpp.UInt32;
	@:native("FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH")
	static final LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH:cpp.UInt32;
	@:native("FT_LOAD_NO_RECURSE")
	static final LOAD_NO_RECURSE:cpp.UInt32;
	@:native("FT_LOAD_IGNORE_TRANSFORM")
	static final LOAD_IGNORE_TRANSFORM:cpp.UInt32;
	@:native("FT_LOAD_MONOCHROME")
	static final LOAD_MONOCHROME:cpp.UInt32;
	@:native("FT_LOAD_LINEAR_DESIGN")
	static final LOAD_LINEAR_DESIGN:cpp.UInt32;
	@:native("FT_LOAD_SBITS_ONLY")
	static final LOAD_SBITS_ONLY:cpp.UInt32;
	@:native("FT_LOAD_NO_AUTOHINT")
	static final LOAD_NO_AUTOHINT:cpp.UInt32;
	@:native("FT_LOAD_COLOR")
	static final LOAD_COLOR:cpp.UInt32;
	@:native("FT_LOAD_COMPUTE_METRICS")
	static final LOAD_COMPUTE_METRICS:cpp.UInt32;
	@:native("FT_LOAD_BITMAP_METRICS_ONLY")
	static final LOAD_BITMAP_METRICS_ONLY:cpp.UInt32;

    @:native("FT_LOAD_TARGET_")
    static function LOAD_TARGET(x:FTRenderMode):cpp.UInt32;

    @:native("FT_Init_FreeType")
    static function init(lib:RawPointer<FTLibrary>):FTErr;

    @:native("FT_Done_FreeType")
    static function done(lib:FTLibrary):FTErr;

    @:native("FT_New_Face")
    static function newFace(lib:FTLibrary, filePath:ConstCharStar, index:cpp.Int32, facePtr:RawPointer<FTFace>):FTErr;

    @:native("FT_New_Memory_Face")
    static function newMemoryFace(lib:FTLibrary, bytes:RawPointer<cpp.UInt8>, size:cpp.Int32, index:cpp.Int32, facePtr:RawPointer<FTFace>):FTErr;

    // TODO: FT_Open_Face, FT_Attach_Stream & FT_Open_Args

    @:native("FT_Attach_File")
    static function attachFile(face:FTFace, filePath:ConstCharStar):FTErr;

    @:native("FT_Reference_Face")
    static function referenceFace(face:FTFace):FTErr;

    @:native("FT_Done_Face")
    static function doneFace(face:FTFace):FTErr;

    @:native("FT_Select_Size")
    static function selectSize(face:FTFace, strikeIndex:Int):FTErr;

    @:native("FT_Request_Size")
    static function requestSize(face:FTFace, request:FTSizeRequest):FTErr;

    @:native("FT_Set_Char_Size")
    static function setCharSize(face:FTFace, width:cpp.Int64, height:cpp.Int64, horiRes:cpp.UInt32, vertRes:cpp.UInt32):FTErr;

    @:native("FT_Set_Pixel_Sizes")
    static function setPixelSizes(face:FTFace, pixelWidth:cpp.UInt32, pixelHeight:cpp.UInt32):FTErr;

    @:native("FT_Load_Glyph")
    static function loadGlyph(face:FTFace, glyphIndex:cpp.UInt32, loadFlags:cpp.UInt32):FTErr;

    @:native("FT_Load_Char")
    static function loadChar(face:FTFace, charCode:cpp.UInt64, loadFlags:cpp.UInt32):FTErr;

    @:native("FT_Set_Transform")
    static function setTransform(face:FTFace, matrix:RawPointer<FTMatrix>, delta:RawPointer<FTVector>):Void;

    @:native("FT_Get_Transform")
    static function getTransform(face:FTFace, matrix:RawPointer<FTMatrix>, delta:RawPointer<FTVector>):Void;

    @:native("FT_Render_Glyph")
    static function renderGlpyh(slot:FTGlyphSlot, renderMode:FTRenderMode):FTErr;

    @:native("FT_Get_Kerning")
    static function getKerning(face:FTFace, leftGlyph:cpp.UInt32, rightGlyph:cpp.UInt32, kernMode:cpp.UInt32, kerning:RawPointer<FTVector>):FTErr;

    @:native("FT_Get_Track_Kerning")
    static function getTrackKerning(face:FTFace, pointSize:cpp.Int64, degree:Int, kerning:RawPointer<cpp.Int64>):FTErr;

    // TODO: FT_Select_Charmap  & FT_Encoding

    @:native("FT_Set_Charmap")
    static function setCharmap(face:FTFace, charMap:FTCharMap):FTErr;

    @:native("FT_Get_Charmap_Index")
    static function getCharmapIndex(charMap:FTCharMap):Int;

    @:native("FT_Get_Char_Index")
    static function getCharIndex(face:FTFace, charCode:cpp.UInt64):cpp.UInt32;

    @:native("FT_Get_First_Char")
    static function getFirstChar(face:FTFace, agIndex:RawPointer<cpp.UInt32>):cpp.UInt64;

    @:native("FT_Get_Next_Char")
    static function getNextChar(face:FTFace, charCode:cpp.UInt64, agIndex:RawPointer<cpp.UInt32>):cpp.UInt64;

    @:native("FT_Face_Properties")
    static function faceProperties(face:FTFace, numProperties:cpp.UInt32, properties:RawPointer<FTParameter>):FTErr;

    @:native("FT_Get_Name_Index")
    static function getNameIndex(face:FTFace, glyphName:cpp.ConstCharStar):cpp.Int32;

    inline static function getGlyphName(face:FTFace, glyphIndex:cpp.UInt32, buffer:Any, bufferMax:cpp.UInt32):FTErr {
        return untyped __cpp__("FT_Get_Glyph_Name({0}, {1}, {2}, {3})", face, glyphIndex, buffer, bufferMax);
    }

    @:native("FT_Get_Postscript_Name")
    static function getPostscriptName(face:FTFace):cpp.ConstCharStar;

    @:native("FT_Get_SubGlyph_Info")
    static function getSubglyphInfo(glyph:FTGlyphSlot, subIndex:cpp.UInt32, pIndex:RawPointer<Int>, pFlags:RawPointer<cpp.UInt32>, pArg1:RawPointer<Int>, pArg2:RawPointer<Int>, pTransform:RawPointer<FTMatrix>):FTErr;

    @:native("FT_Get_FSType_Flags")
    static function getFSTypeFlags(face:FTFace):cpp.UInt16;

    @:native("FT_Face_GetCharVariantIndex")
    static function faceGetCharVariantIndex(face:FTFace, charCode:cpp.UInt64, variantSelector:cpp.UInt64):cpp.UInt32;

    @:native("FT_Face_GetCharVariantIsDefault")
    static function faceGetCharVariantIsDefault(face:FTFace, charCode:cpp.UInt64, variantSelector:cpp.UInt64):Int;

    @:native("FT_Face_GetVariantSelectors")
    static function faceGetVariantSelectors(face:FTFace):RawPointer<cpp.Int32>;

    @:native("FT_Face_GetVariantsOfChar")
    static function faceGetVariantsOfChar(face:FTFace, charCode:cpp.UInt64):RawPointer<cpp.UInt32>;

    @:native("FT_Face_GetCharsOfVariant")
    static function faceGetCharsOfVariant(face:FTFace, variantSelector:cpp.UInt64):RawPointer<cpp.UInt32>;

    @:native("FT_Library_Version")
    static function libraryVersion(lib:FTLibrary, major:RawPointer<Int>, minor:RawPointer<Int>, patch:RawPointer<Int>):Void;

    @:native("FT_Face_CheckTrueTypePatents")
    static function faceCheckTrueTypePatents(face:FTFace):cpp.UInt8;

    @:native("FT_Face_SetUnpatentedHinting")
    static function faceSetUnpatentedHinting(face:FTFace, value:cpp.UInt8):cpp.UInt8;

    @:native("FT_Error_String")
    static function errorString(code:FTErr):ConstCharStar;
}