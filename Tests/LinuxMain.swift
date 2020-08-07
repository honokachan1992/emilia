import XCTest

import lolTests

var tests = [XCTestCaseEntry]()
tests += lolTests.allTests()
XCTMain(tests)
