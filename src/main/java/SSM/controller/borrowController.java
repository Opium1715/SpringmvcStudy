package SSM.controller;

import SSM.pojo.Book;
import SSM.pojo.Borrow;
import SSM.pojo.Customer;
import SSM.service.bookService;
import SSM.service.borrowService;
import SSM.service.customerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class borrowController {
    @Autowired
    private borrowService borrowService;
    @Autowired
    private bookService bookService;
    @Autowired
    private customerService customerService;

    @GetMapping("/borrowList")
    public ModelAndView Display(@RequestParam(defaultValue = "1") Integer PageNo ){
        PageInfo<Borrow> borrowPageInfo = borrowService.getAllBorrow(PageNo);
        return new ModelAndView("borrowlist","pageInfo",borrowPageInfo);
    }

    @GetMapping("/borrowListSearch")
    public ModelAndView DisplaySearch(@RequestParam(defaultValue = "1") Integer PageNo,
                                      String username, String bookName){
        PageInfo<Borrow> borrowPageInfo = borrowService.getAllBorrowBySearch(PageNo,username,bookName);
        return new ModelAndView("borrowlist","pageInfo",borrowPageInfo);
    }


    @GetMapping("/returnBook")
    public ModelAndView Update(Integer id){
        Borrow borrow = borrowService.getBorrowById(id);
        borrow.setRdate(new Date());
        borrowService.UpdateBorrow(borrow);
        return new ModelAndView("redirect:borrowList");
    }



    @GetMapping("/borrowAdd")
    public ModelAndView Create(Integer id){
        Map<String,Object> map = new HashMap<>();
        List<Book> bookList = bookService.getAllBook();
        List<Customer> customerList = customerService.getAllCustomer();
        map.put("books",bookList);
        map.put("customers",customerList);
        return new ModelAndView("borrow",map);
    }

    @PostMapping("/borrowSave")
    public ModelAndView Add(Borrow borrow){
        borrow.setBdate(new Date());
        borrowService.AddBorrow(borrow);
        return new ModelAndView("redirect:borrowList");
    }

    @DeleteMapping("/borrowDelete")
    public ModelAndView Delete(Integer id){
        borrowService.DeleteBorrow(id);
        return new ModelAndView("redirect:borrowList");
    }
}
