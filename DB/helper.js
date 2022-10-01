function getOffset(currentPage = 1, listPerPage) {
    return (currentPage - 1) * [listPerPage];
  }
  
  function emptyOrRows(rows) {
    if (!rows) {
      return [];
    }
    return rows;
  }

  function hasmore(listPerPage,count){
    // let temp = rows_count-(offset+listPerPage)
    if(listPerPage == count){
      return true;
    }else{
      return false;
    }

  }


  
  module.exports = {
    getOffset,
    emptyOrRows,
    hasmore
    
  }