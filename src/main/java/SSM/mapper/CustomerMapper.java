package SSM.mapper;

import SSM.pojo.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    Customer selectByPrimaryKey(Integer id);

    List<Customer> selectAll(@Param("phone") String phone,@Param("username") String username,@Param("address") String address,
                             @Param("company") String company);

    int updateByPrimaryKey(Customer record);
}