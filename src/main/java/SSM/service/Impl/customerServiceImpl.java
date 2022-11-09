package SSM.service.Impl;

import SSM.mapper.CustomerMapper;
import SSM.pojo.Customer;
import SSM.service.customerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class customerServiceImpl implements customerService {
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public List<Customer> getAllCustomer() {
        return customerMapper.selectAll(null,null,null,null);
    }

    @Override
    public PageInfo<Customer> getAllCustomer(Integer PageNo) {
        PageHelper.startPage(PageNo,13);
        List<Customer> customerList = customerMapper.selectAll(null,null,null,null);
        return new PageInfo<>(customerList);
    }

    @Override
    public PageInfo<Customer> getAllCustomerBySearch(Integer PageNo, String phone, String username, String address, String company) {
        PageHelper.startPage(PageNo,13);
        List<Customer> customerList = customerMapper.selectAll(phone, username, address, company);
        return new PageInfo<>(customerList);
    }

    @Override
    public void AddCustomer(Customer customer) {
        customerMapper.insert(customer);
    }

    @Override
    public void DeleteCustomer(Integer id) {
        customerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void UpdateCustomer(Customer customer) {
        customerMapper.updateByPrimaryKey(customer);
    }

    @Override
    public Customer getCustomerById(Integer id) {
        return customerMapper.selectByPrimaryKey(id);
    }
}
