import UIKit
import XCTest
import ReadersWriterLock

class Tests: XCTestCase {
    
    func testShouldWriteAndReadSuccessfully() {
        let lock = ReadersWriterLock()
        
        var list = [String]()
        
        lock.withWriteLock {
            list.append("1")
        }
        
        lock.withReadLock {
            let value = list[0]
            XCTAssertEqual(value, "1", "The value should be 1")
        }
    }

    func testShouldHandleConcurrentReadsSuccessfully() {
        let lock = ReadersWriterLock()
        
        var list = [String]()
        
        lock.withWriteLock {
            list.append("1")
        }
        
        lock.withReadLock {
            let value = list[0]
            XCTAssertEqual(value, "1", "The value should be 1")

            lock.withReadLock {
                let value = list[0]
                XCTAssertEqual(value, "1", "The value should still be 1")
            }
        }
    }
}
