/// A list is either empty or it is composed of a first element (head)
/// and a tail, which is a list itself.
///
/// See http://www.enekoalonso.com/projects/99-swift-problems/#linked-lists

import Foundation

public class List<T> {
  
  public var value: T
  public var nextItem: List<T>?
  
  public convenience init?(_ values: T...) {
    self.init(Array(values))
  }
  
  public init?(_ values: [T]) {
    guard let first = values.first else {
      return nil
    }
    value = first
    nextItem = List(Array(values.suffix(from: 1)))
  }
  
  public func printList() {
    let list = self
    var result = "List: \(list.value)"
    while let next = list.nextItem {
      result += " \(next.value)"
      list.nextItem = next.nextItem
    }
    print(result)
  }
  
}
