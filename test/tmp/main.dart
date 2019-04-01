#!/usr/bin/env dart

class Array {

  var
    list
  , index = 0
  ;

  Array (list) {
    this.list = list
    ;
  }

  reduce(iterator, [initValue]) {
    if(initValue == null) {
      initValue = []
      ;
    }
    return list.fold(initValue, (r, c){
      r = iterator(r, c, this.index, list)
      ;
      this.index++
      ;
      return r
      ;
    })
    ;
  }
}

main() {
  print( Array([
    'Hello'
  , 123
  , true
  ])
  .reduce(
    (r, c, i, a) {
      print({
        'r': r
      , 'c': c
      , 'i': i
      , 'a': a
      });
      return []
        ..addAll(r)
        ..add(c)
      ;
    }
  )
  )
  ;
}
