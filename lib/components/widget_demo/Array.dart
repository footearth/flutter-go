class Array<T> {

  List<T> list = []
  ;
  int index = 0
  ;

  Array (this.list)
  ;

  reduce(iterator, [initValue]) {

    if(initValue == null) {
      initValue = []
      ;
    }

    return list.fold(initValue, (r, c) {
      r = iterator(r, c, this.index, list)
      ;
      this.index++
      ;
      return r
      ;
    }
    )
    ;
  }

}
