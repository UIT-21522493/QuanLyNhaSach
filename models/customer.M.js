const db = require('./db');
const tbName = 'KhachHang';
class CustomerModel {
    async all() {
        const res = await db.load(tbName, 'MaKH');
        return res;
    }
    
    async updateDebt (id, debt) {
        let customer = {
            MaKH: id,
            TienNo: debt
        };
        const condition = `WHERE "MaKH" = ${id}`;
        const res = await db.patch(tbName, ['MaKH', 'TienNo'], customer, condition);
        return res;
    }
}
module.exports = new CustomerModel;