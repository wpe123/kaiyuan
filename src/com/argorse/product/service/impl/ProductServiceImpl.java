package com.argorse.product.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.argorse.admin.dao.AdminDao;
import com.argorse.admin.dao.impl.AdminDaoImpl;
import com.argorse.admin.domain.Admin;
import com.argorse.product.dao.ProductDao;
import com.argorse.product.dao.impl.ProductDaoImpl;
import com.argorse.product.domain.Product;
import com.argorse.product.service.ProductService;

public class ProductServiceImpl implements ProductService {

	private static ProductDao productDao;
	private static AdminDao adminDao;

	static {
		adminDao = new AdminDaoImpl();
		productDao = new ProductDaoImpl();
	}

	@Override
	public void addProduct(Product p) throws SQLException {
		productDao.addProduct(p);
	}

	@Override
	public void delProductById(String id) throws SQLException {
		productDao.delProductById(id);
	}

	@Override
	public List findAllProduct() throws SQLException {
		return productDao.findAllProduct();
	}

	@Override
	public Product findProductById(String id) throws SQLException {
		return productDao.findProductById(id);
	}

	@Override
	public void updateProduct(Product p) throws SQLException {
		productDao.updateProduct(p);
	}

	@Override
	public Product findProductByIdAdmin(String id, Admin admin) throws SQLException {
		System.out.println("findProductByIdAdmin invoke...");
		Product product = productDao.findProductById(id);
		Admin adminExist = adminDao.findAdminByName(admin.getAdmin_name());
		if (product != null) {
			adminExist.setScore(adminExist.getScore() - 2);
			adminDao.updateAdmin(adminExist);
		}
		return product;
	}

	@Override
	public Admin findAdminByName(String name) throws SQLException {
		return adminDao.findAdminByName(name);
	}

}
