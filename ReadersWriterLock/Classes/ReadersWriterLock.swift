import Foundation

// Implementation based on http://swiftweb.johnholdsworth.com/Deferred/html/ReadWriteLock.html

// A readers-writer lock provided by the platform implementation of the POSIX Threads standard. Read more: https://en.wikipedia.org/wiki/POSIX_Threads
public final class ReadersWriterLock {
    private var lock: UnsafeMutablePointer<pthread_rwlock_t>
    
    public init() {
        self.lock = UnsafeMutablePointer.allocate(capacity: 1)
        let status = pthread_rwlock_init(lock, nil)
        assert(status == 0)
    }
    
    deinit {
        let status = pthread_rwlock_destroy(lock)
        assert(status == 0)
        lock.deinitialize()
        lock.deallocate(capacity: 1)
    }
    
    public func withReadLock<T>(body: () throws -> T) rethrows -> T {
        pthread_rwlock_rdlock(lock)
        defer {
            pthread_rwlock_unlock(lock)
        }
        return try body()
    }
    
    public func withWriteLock<T>(body: () throws -> T) rethrows -> T {
        pthread_rwlock_wrlock(lock)
        defer {
            pthread_rwlock_unlock(lock)
        }
        return try body()
    }
}

