const db = require('./db');
const tbName = 'PhieuThuTien';
class DebtPayModel {
    async all() {
        const res = await db.load(tbName, 'MaPTT');
        return res;
    }
}
module.exports = new DebtPayModel;