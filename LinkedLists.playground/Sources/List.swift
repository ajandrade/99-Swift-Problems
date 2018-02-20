/// A list is either empty or it is composed of a first element (head)
/// and a tail, which is a list itself.
///
/// See http://www.enekoalonso.com/projects/99-swift-problems/#linked-lists

import Foundation

class List<T> {
  
  var value: T
  var nextItem: List<T>?
  
  convenience init?(_ values: T...) {
    self.init(Array(values))
  }
  
  init?(_ values: [T]) {
    guard let first = values.first else {
      return nil
    }
    value = first
    nextItem = List(Array(values.suffix(from: 1)))
  }
  
}
