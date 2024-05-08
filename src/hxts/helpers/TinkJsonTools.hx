package hxts.helpers;

import tink.Chunk;
using tink.CoreApi;

class TinkJsonTools {
	public static function stringifyHex(hex:String):Outcome<String, Error> {
		final regex = ~/([^0-9a-fA-F])/;

		return if (regex.match(hex))
			Failure(new Error('Invalid character ${regex.matched(1)}'));
		 else if (hex.length % 2 != 0)
			Failure(new Error('Non-even number of characters'));
		else {
			final str:String = tink.Json.stringify(haxe.io.Bytes.ofHex(hex));

			switch [str.charAt(0), str.charAt(str.length - 1)] {
				case ['"', '"']: Success(str.substring(1, str.length - 1));
				case _: Success(str);
			}
		}
	}

	public static function parseChunk(str:String):Chunk {
		return tink.Json.parse(str);
	}
}
