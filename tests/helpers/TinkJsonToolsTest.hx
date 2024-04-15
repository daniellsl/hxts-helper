package helpers;

import tink.core.Option;
import hxts.helpers.TinkJsonTools;

@:asserts
class TinkJsonToolsTest {
	public function new() {}

	@:variant('31233333', Some('MzEyMzMzMzM='))
	@:variant('00233333', Some('MDAyMzMzMzM='))
	@:variant('g', None)
	public function stringifyHex(hex:String, expected:Option<String>) {
		final output = TinkJsonTools.stringifyHex(hex);

		switch [output, expected] {
			case [Success(v), Some(result)]:
				asserts.assert(v == result);
			case [Failure(_), None]:
				asserts.assert(true);
			case [Failure(e), Some(v)]:
				asserts.fail('Expected $v but got ${e.message}');
			case [Success(v), None]:
				asserts.fail('Expected failure but got $v');
		}

		return asserts.done();
	}
}
