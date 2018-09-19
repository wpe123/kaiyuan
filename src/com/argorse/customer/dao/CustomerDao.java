package com.argorse.customer.dao;

import java.util.List;
import com.argorse.customer.domain.Customer;

public interface CustomerDao {
	   public void insertCustomer(Customer customer);//���ӿͻ�
	   
	   public void delCustomer(String id);//ɾ���ͻ�
	   
	   public List selectCustomer();//��ѯ�ͻ�
	   
	   public Customer selectCustomerById(String id);//����Id��ѯ�ͻ�
	   
	   public void updateCustomer(Customer customer);//���¿ͻ�
}
