package SSM.service;

import SSM.pojo.Customer;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface customerService {

    List<Customer> getAllCustomer();
    PageInfo<Customer> getAllCustomer(Integer PageNo);

    PageInfo<Customer> getAllCustomerBySearch(Integer PageNo, String phone,String username,String address, String company);

    void AddCustomer(Customer customer);

    void DeleteCustomer(Integer id);

    void UpdateCustomer(Customer customer);

    Customer getCustomerById(Integer id);
}
