import SSM.pojo.Customer;
import SSM.service.customerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:Spring.xml")
public class customerServiceTest {
    @Autowired
    private SSM.service.customerService customerService;

    @Test
    public void getAllCustomerTest() {
        customerService.getAllCustomer().forEach(System.out::println);
    }

    @Test
    public void getAllCustomerByPageTest() {
        customerService.getAllCustomer(1).getList().forEach(System.out::println);
    }

    @Test
    public void getCustomerBySearchTest() {
        customerService.getAllCustomerBySearch(1,"134",null,"广州",null).
                getList().forEach(System.out::println);
    }

    @Test
    public void AddCustomerTest() {
        customerService.AddCustomer(new Customer());
    }

    @Test
    public void UpdateCustomerTest() {
        Customer customer = customerService.getCustomerById(55);
        customer.setName("李宇");
        customer.setPhone("13584568512");
        customer.setAddress("中国广西");
        customer.setCompany("广西大学");
        customerService.UpdateCustomer(customer);
    }

    @Test
    public void DeleteCustomerTest() {
        customerService.DeleteCustomer(55);
    }
}
