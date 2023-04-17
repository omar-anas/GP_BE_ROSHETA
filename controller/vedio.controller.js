const db = require('../DB/exectuemysql');
const helper = require('../DB/helper')
const config = require('../DB/mysqlconfig');

require('dotenv');
class VedioController {

static getAllVedios = async (req,res) =>{
    try {
        let page = req.query.page;
        let limit = req.query.limit;
        let listPerPage = limit ? limit : config.listPerPage;

        const offset = helper.getOffset(page, listPerPage);
        const rows = await db.query(
            `call GET_ALL_VEDIOS_of_DOCTORS(${offset},${listPerPage})`
        );
        const data = helper.emptyOrRows(rows);
        const totalNumber = (data[0][0]?data[0][0]['number_of_rows']:0);
        const count = (totalNumber) - offset > listPerPage ? listPerPage: (totalNumber) - offset > 0 ? (totalNumber) - offset :0   ;
        data[1]['offset']=offset;
        data[1]['page']=page;
        data[1]['count']= count;
        data[1]['totalNumber']= totalNumber;
        data[1]['limit']=listPerPage;
        const hasmore = data != []?  helper.hasmore(listPerPage,count) : false
        data[1]['hasmore']=hasmore;
        res.json({ message: "success fetched all vedios", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}
static getVedio = async (req,res) =>{
    try {
        
        
        const rows = await db.query(
            `call GET_DOCTOR_HAS_VEDIO(${req.params.id})`
        );
        const data = helper.emptyOrRows(rows);
        
        res.json({ message: "success fetched  vedio", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}


static addVedio =async (req,res)=>{
    const vedio = req.body
        try {
            let VEDIO_DOCTOR_ID_V = vedio.Doctor_ID
            let VEDIO_VEDIO_V = vedio.Vedio
            let VEDIO_Desccription_V = vedio.Desccription
            
            const rows = await db.query(
                `call ADD_NEW_VEDIO_of_DOCTOR(${VEDIO_DOCTOR_ID_V},'${VEDIO_VEDIO_V}','${VEDIO_Desccription_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success VEDIO IS ADDED", data });
                
            } catch (error) {
                res.json({ message: "failed Process", error: error.message });
                
            }
        }
        
        static editVedio = async (req,res)=>{
            const vedio = req.body
            try {
                let VEDIO_ID_V = req.params.id
                let VEDIO_DOCTOR_ID_V = vedio.Doctor_ID
                let VEDIO_VEDIO_V = vedio.Vedio
                let VEDIO_Desccription_V = vedio.Desccription

                const rows = await db.query(
                `call EDIT_DOCTOR(${VEDIO_ID_V},'${VEDIO_DOCTOR_ID_V}','${VEDIO_VEDIO_V}','${VEDIO_Desccription_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success VEDIO IS MODIFIED", data });

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });

        }
}




}

module.exports = VedioController