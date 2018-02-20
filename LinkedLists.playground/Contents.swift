import Foundation

/*
 P01 (*) Find the last element of a linked list.
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

let p01 = List(1, 1, 2, 3, 5, 8)
p01?.last
