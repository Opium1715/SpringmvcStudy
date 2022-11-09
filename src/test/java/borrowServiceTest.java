import SSM.pojo.Borrow;
import SSM.service.borrowService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Calendar;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:Spring.xml")
public class borrowServiceTest {
    @Autowired
    private SSM.service.borrowService borrowService;

    @Test
    public void getAllBorrow() {
        borrowService.getAllBorrow(1).getList().forEach(System.out::println);
    }

    @Test
    public void getAllBorrowBySearchTest() {
        borrowService.getAllBorrowBySearch(1,"zhangsan","战争论").
                getList().forEach(System.out::println);
    }

    @Test
    public void getBorrowByIdTest() {
        System.out.println(borrowService.getBorrowById(3));
    }

    @Test
    public void AddBorrowTest() {
        borrowService.AddBorrow(new Borrow());
    }

    @Test
    public void UpdateBorrowTest() {
        Borrow borrow = borrowService.getBorrowById(11);
        borrow.setCustomerid(10);
        borrow.setBookid(10);
        borrow.setBdate(new Date());
        borrow.setRdate(new Date(122, Calendar.DECEMBER,21));
        borrowService.UpdateBorrow(borrow);
    }

    @Test
    public void DeleteBorrowTest() {
        borrowService.DeleteBorrow(11);
    }
}
