import Foundation

// Problems @ http://www.enekoalonso.com/projects/99-swift-problems/

/* P01 (*) Find the last element of a linked list.
 Example: List(1, 1, 2, 3, 5, 8).last
 Result: 8
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

// -------- //

/* P02 (*) Find the last but one element of a linked list.
 Example: List(1, 1, 2, 3, 5, 8).pennultimate
 Result: 5
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
//let p02 = List(1, 1, 2, 3, 5, 8)
//p02?.pennultimate

// -------- //

/* P03 (*) Find the Kth element of a linked list.
 By convention, the first element in the list is element 0. Use Swift subscripts to get the value from the linked list.
 
 Example:
  let list = List(1, 1, 2, 3, 5, 8)
  list[2]
 
 Result: 2
*/

extension List {
    subscript(index: Int) -> T? {
        return element(self, at: index)
    }
    
    private func element(_ list: List, at index: Int) -> T? {
        if index == 0 { return list.value }
        guard let next = list.nextItem else { return nil }
        return element(next, at: index - 1)
    }
}

// Test P03:
//let list = List(1, 1, 2, 3, 5, 8)
//list?[6]

// -------- //

/* P04 (*) Find the number of elements of a linked list.
 Example: List(1, 1, 2, 3, 5, 8).length
 Result: 6
 */

extension List {
  var length: Int {
    return length(self, counter: 1)
  }
  
  private func length(_ list: List, counter: Int) -> Int {
    guard let next = list.nextItem else { return counter }
    return length(next, counter: counter + 1)
  }
}

// Test P04:
//let list = List(1, 1, 2, 3, 5, 8)
//list?.length

// -------- //

/* P05 (*) Reverse a linked list.
 Example: List(1, 1, 2, 3, 5, 8).reverse()
 Result: List(8, 5, 3, 2, 1, 1)
*/

extension List {
  func reversed() -> List? {
    return reverse(self, newList: nil)
  }

  private func reverse(_ list: List, newList: List?) -> List? {
    guard let next = list.nextItem else {
      let head = List(list.value)
      head?.nextItem = newList
      return head
    }

    if newList == nil {
      let tail = List(list.value)
      return reverse(next, newList: tail)
    }
    
    let new = List(list.value)
    new?.nextItem = newList
    return reverse(next, newList: new)
  }
}

// Test P05:
//let reversedList = List(1, 1, 2, 3, 5, 8)?.reversed()
//reversedList?.printList()
