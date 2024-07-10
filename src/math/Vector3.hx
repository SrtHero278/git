package math;

@:forward extern abstract Vector3(Vector3Base) from Vector3Base to Vector3Base {
    @:op(-A) public inline function negative()      return this.multiplyFloat(-1);

	@:op(A + B) public inline function addOp(vec:Vector3Base)		return this.add(vec);
	@:op(A += B) public inline function addEqOp(vec:Vector3Base)	return this.addEq(vec);
    @:op(A + B) public inline function addFloatOp(val:Float)		return this.addFloat(val);
    @:op(A += B) public inline function addFloatEqOp(val:Float)		return this.addFloatEq(val);

    @:op(A - B) public inline function subtractOp(vec:Vector3Base)		return this.subtract(vec);
    @:op(A -= B) public inline function subtractEqOp(vec:Vector3Base)	return this.subtractEq(vec);
    @:op(A - B) public inline function subtractFloatOp(val:Float)		return this.subtractFloat(val);
    @:op(A -= B) public inline function subtractFloatEqOp(val:Float)	return this.subtractFloatEq(val);

    @:op(A * B) public inline function multiplyOp(vec:Vector3Base)		return this.multiply(vec);
    @:op(A *= B) public inline function multiplyEqOp(vec:Vector3Base)	return this.multiplyEq(vec);
    @:op(A * B) public inline function multiplyFloatOp(val:Float)		return this.multiplyFloat(val);
    @:op(A *= B) public inline function multiplyFloatEqOp(val:Float)	return this.multiplyFloatEq(val);

    @:op(A / B) public inline function divideOp(vec:Vector3Base)		return this.divide(vec);
    @:op(A /= B) public inline function divideEqOp(vec:Vector3Base)		return this.divideEq(vec);
    @:op(A / B) public inline function divideFloatOp(val:Float)			return this.divideFloat(val);
    @:op(A /= B) public inline function divideFloatEqOp(val:Float)		return this.divideFloatEq(val);
}

@:build(blueprint.Macros.swizzle(["x", "y", "z"], [
	["r", "red::255"],
	["g", "green::255"],
	["b", "blue::255"]
]))
class Vector3Base {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	@:isVar public var z(get, set):Float;

	public var magnitude(get, never):Float;

	public function new(?x:Float, ?y:Float, ?z:Float) {
		set(x, y, z);
	}

	public inline function set(?x:Float, ?y:Float, ?z:Float):Vector3Base {
		this.x = (x != null) ? x : 0;
		this.y = (y != null) ? y : this.x;
		this.z = (z != null) ? z : this.y;

        return this;
	}

	public inline function add(vec:Vector3Base):Vector3Base
        return new Vector3Base(this.x + vec.x, this.y + vec.y, this.z + vec.z);
	public inline function addEq(vec:Vector3Base):Vector3Base
        return set(this.x + vec.x, this.y + vec.y, this.z + vec.z);
    public inline function addFloat(val:Float):Vector3Base
        return new Vector3Base(this.x + val, this.y + val, this.z + val);
    public inline function addFloatEq(val:Float):Vector3Base
        return set(this.x + val, this.y + val, this.z + val);

    public inline function subtract(vec:Vector3Base):Vector3Base
        return new Vector3Base(this.x - vec.x, this.y - vec.y, this.z - vec.z);
    public inline function subtractEq(vec:Vector3Base):Vector3Base
        return set(this.x - vec.x, this.y - vec.y, this.z - vec.z);
    public inline function subtractFloat(val:Float):Vector3Base
        return new Vector3Base(this.x - val, this.y - val, this.z - val);
    public inline function subtractFloatEq(val:Float):Vector3Base 
        return set(this.x - val, this.y - val, this.z - val);

    public inline function multiply(vec:Vector3Base):Vector3Base
        return new Vector3Base(this.x * vec.x, this.y * vec.y, this.z * vec.z);
    public inline function multiplyEq(vec:Vector3Base):Vector3Base
        return set(this.x * vec.x, this.y * vec.y, this.z * vec.z);
    public inline function multiplyFloat(val:Float):Vector3Base
        return new Vector3Base(this.x * val, this.y * val, this.z * val);
    public inline function multiplyFloatEq(val:Float):Vector3Base
        return set(this.x * val, this.y * val, this.z * val);

    public inline function divide(vec:Vector3Base):Vector3Base
        return new Vector3Base(this.x / vec.x, this.y / vec.y, this.z / vec.z);
    public inline function divideEq(vec:Vector3Base):Vector3Base
        return set(this.x / vec.x, this.y / vec.y, this.z / vec.z);
    public inline function divideFloat(val:Float):Vector3Base
        return new Vector3Base(this.x / val, this.y / val, this.z / val);
    public inline function divideFloatEq(val:Float):Vector3Base
        return set(this.x / val, this.y / val, this.z / val);

	public inline function copyFrom(vec:Vector3Base):Vector3Base
        return set(vec.x, vec.y, vec.z);

	/**
	 * Converts the vector into a c array, mainly used for OpenGL Shaders.
	 * 
	 * NOTE: For proper memory management, please call `CppHelpers.free` when you are fully finished with the c array.
	 * 
     * @return RawPointer<cpp.Float32>
     */
	public function toCArray():cpp.RawPointer<cpp.Float32> {
		untyped __cpp__("float _cArray[3] = { {0}, {1}, {2} }", this.x, this.y, this.z);
		return untyped __cpp__("_cArray");
	}

	@:noCompletion private inline function get_x():Float return this.x;
	@:noCompletion private inline function set_x(v:Float):Float return this.x = v;

	@:noCompletion private inline function get_y():Float return this.y;
	@:noCompletion private inline function set_y(v:Float):Float return this.y = v;

	@:noCompletion private inline function get_z():Float return this.z;
	@:noCompletion private inline function set_z(v:Float):Float return this.z = v;

	public function get_magnitude():Float
		return Math.sqrt(x * x + y * y + z * z);
}