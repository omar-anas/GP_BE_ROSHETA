const bcrypt = require('bcrypt');
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

  const doctorEmailGenerator =(FN , LN )=>{
    const signature = "Roshetty.com"
    const randomNum  = Math.floor(Math.random() * 100);
    const email =`${FN}_${LN}${randomNum}@${signature}` 
    return email
  }


  const hashingPassword = async (password)=>{
    const salt = process.env.SALT
                
    let HASHED_PASSWORD_V = await bcrypt.hash(password, salt);
                
    HASHED_PASSWORD_V = `'${HASHED_PASSWORD_V}'`
    
    return HASHED_PASSWORD_V;
  }
  
  module.exports = {
    getOffset,
    emptyOrRows,
    hasmore,
    doctorEmailGenerator,
    hashingPassword
    
  }