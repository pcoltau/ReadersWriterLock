# ReadersWriterLock

[![CI Status](http://img.shields.io/travis/pcoltau@gmail.com/ReadersWriterLock.svg?style=flat)](https://travis-ci.org/pcoltau@gmail.com/ReadersWriterLock)
[![Version](https://img.shields.io/cocoapods/v/ReadersWriterLock.svg?style=flat)](http://cocoapods.org/pods/ReadersWriterLock)
[![License](https://img.shields.io/cocoapods/l/ReadersWriterLock.svg?style=flat)](http://cocoapods.org/pods/ReadersWriterLock)
[![Platform](https://img.shields.io/cocoapods/p/ReadersWriterLock.svg?style=flat)](http://cocoapods.org/pods/ReadersWriterLock)

A readers-writer lock is a shared-exclusive lock. It allows for concurrent read locks, but require exclusive access to write locks.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ReadersWriterLock is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ReadersWriterLock'
```

## Usage

```
// import the module in your source
import ReadersWriterLock

// Create a normal dictionary
var dictionary = [String: String]()

// Create the lock
let lock = ReadersWriterLock()

// Write values to the dictionary using the write lock
lock.withWriteLock {
    dictionary["value"] = "test"
}

// Read values from the dictionary using a read lock
let value = lock.withReadLock {
    dictionary["value"]!
}

print(value) // "test"
```

## Author

pcoltau@gmail.com

## License

ReadersWriterLock is available under the MIT license. See the LICENSE file for more info.
