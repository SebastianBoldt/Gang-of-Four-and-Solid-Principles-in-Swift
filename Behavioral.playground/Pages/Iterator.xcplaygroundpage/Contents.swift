//: [Previous](@previous)

import Foundation

public struct Book {
    var name : String
}

public struct Library {
    var catalog = [Book]()
}

public struct LibraryIterator : IteratorProtocol {
    
    public  var lib : Library
    private var currentIndex : Int = 0
    
    public init(lib: Library) {
        self.lib = lib
    }
    
    mutating public func next() -> Book? {
        defer{ currentIndex = currentIndex + 1}
        return currentIndex >= lib.catalog.count ? nil : lib.catalog[currentIndex]
    }
}

extension Library : Sequence {
    public func makeIterator() -> LibraryIterator {
        return LibraryIterator(lib:self)
    }
}


let catalog = [Book(name:"Bla"),Book(name:"Blub"),Book(name:"Foo")]
let library = Library(catalog: catalog)

for book in library {
    print(book.name)
}
//: [Next](@next)
