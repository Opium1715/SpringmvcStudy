package SSM.controller;

import SSM.pojo.Customer;
import SSM.service.customerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class customerController {
    @Autowired
    private customerService customerService;

    @GetMapping("/customerList")
    public ModelAndView Display(@RequestParam(defaultValue = "1") Integer PageNo ){
        PageInfo<Customer> customerPageInfo = customerService.getAllCustomer(PageNo);
        return new ModelAndView("customerlist","pageInfo",customerPageInfo);
    }

    @GetMapping("/customerListSearch")
    public ModelAndView DisplaySearch(@RequestParam(defaultValue = "1") Integer PageNo,
                                      String phone, String username, String address, String company){
        PageInfo<Customer> customerPageInfo = customerService.getAllCustomerBySearch(PageNo,phone,username,address,company);
        return new ModelAndView("customerlist","pageInfo",customerPageInfo);
    }


    @PutMapping ("/customerUpdate")
    public ModelAndView Update(Customer customer){
        customerService.UpdateCustomer(customer);
        return new ModelAndView("redirect:customerList");
    }

    @GetMapping("/customerEdit")
    public ModelAndView Edit(Integer id){
        Customer customer = customerService.getCustomerById(id);
        return new ModelAndView("customeredit","customer",customer);
    }

    @GetMapping("/customerAdd")
    public ModelAndView Create(){
        return new ModelAndView("customeradd");
    }

    @PostMapping("/customerSave")
    public ModelAndView Add(Customer customer){
        customerService.AddCustomer(customer);
        return new ModelAndView("redirect:customerList");
    }

    @DeleteMapping("/customerDelete")
    public ModelAndView Delete(Integer id){
        customerService.DeleteCustomer(id);
        return new ModelAndView("redirect:customerList");
    }

}
