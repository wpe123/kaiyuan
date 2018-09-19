package com.argorse.admin.dao.impl;

import java.sql.SQLException;

import com.argorse.admin.dao.AdminDao;
import com.argorse.admin.domain.Admin;
import com.argorse.util.BaseDao;

public class AdminDaoImpl extends BaseDao implements AdminDao {

	@Override
	public void updateAdmin(Admin a) throws SQLException {
		int rows = this.getSqlMapClient().update("Admin.updateAdmin", a);
		System.out.println("修改记录条数 rows:" + rows);
	}

	@Override
	public Admin findAdminByName(String name) throws SQLException {
		return (Admin) this.getSqlMapClient().queryForObject("Admin.findAdminByName", name);
	}

	@Override
	public void insertAdmin(Admin a) throws SQLException {
		// TODO Auto-generated method stub
		this.getSqlMapClient().insert("Admin.insertAdmin", a);
	}
}
