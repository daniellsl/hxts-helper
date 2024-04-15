package;

import tink.unit.*;
import tink.testrunner.*;
import helpers.*;

class RunTests {
	static function main() {
		Runner.run(TestBatch.make([
			new TinkJsonToolsTest(),
		])).handle(Runner.exit);
	}
}