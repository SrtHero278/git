package blueprint.objects;

import bindings.Glad;

import math.Vector2;
import math.MathExtras;

import blueprint.objects.Sprite;

class Group extends Sprite {
	public var members:Array<Sprite> = [];
	public var skipProperties:Bool = false;

	public function add(object:Sprite):Bool {
		if (members.indexOf(object) > -1)
			return false;

		members.push(object);
		return true;
	}

	public function remove(object:Sprite):Bool {
		var index = members.indexOf(object);

		if (index > -1) {
			members.splice(index, 1);
			return true;
		}
		return false;
	}

	public function insert(index:Int, object:Sprite):Bool {
		if (members.indexOf(object) > -1)
			return false;

		members.insert(index, object);
		return true;
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		for (object in members)
			object.update(elapsed);
	}

	override public function draw():Void {
		if (skipProperties) {
			for (object in members)
				object.draw();
			return;
		}

		if (_queueTrig)
			updateTrigValues();

		final rotPosition:Vector2 = cast [
			position.x * _cosMult + position.y * -_sinMult,
			position.x * _sinMult + position.y * _cosMult
		];
		rotPosition *= scale;

		for (object in members) {
			object.position += rotPosition;
			object.scale *= scale;
			object.rotation += rotation;
			object.tint *= tint;

			object.draw();

			object.position -= rotPosition;
			object.scale /= scale;
			object.rotation -= rotation;
			object.tint /= tint;
		}
	}

	override function destroy() {
		for (object in members)
			object.destroy();
		members.splice(0, members.length);
	}
}
