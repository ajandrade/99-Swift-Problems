import Foundation

/* P01 (*) Find the last element of a linked list.
 http://www.enekoalonso.com/projects/99-swift-problems/#p01
 
 Example:
  List(1, 1, 2, 3, 5, 8).last

 Result:
  8
*/

extension List {
  
  var last: T {
    return last(self)
  }
  
  private func last(_ list: List) -> T {
    guard let nextItem = list.nextItem else { return list.value }
    return last(nextItem)
  }
}

// Test P01:
//let p01 = List(1, 1, 2, 3, 5, 8)
//p01?.last

/* P02 (*) Find the last but one element of a linked list.
 http://www.enekoalonso.com/projects/99-swift-problems/#p02
 
 Example:
  List(1, 1, 2, 3, 5, 8).pennultimate
 
 Result:
  5
*/

extension List {
  var pennultimate: T? {
    return pennultimate(self, previousValue: nil)
  }
  
  private func pennultimate(_ list: List, previousValue: T?) -> T? {
    guard let nextItem = list.nextItem else { return previousValue }
    return pennultimate(nextItem, previousValue: list.value)
  }
}

// Test P02:
let p02 = List(1, 1, 2, 3, 5, 8)
p02?.pennultimate

