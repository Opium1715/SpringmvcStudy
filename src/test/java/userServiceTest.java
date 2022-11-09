import SSM.pojo.User;
import SSM.service.userService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:Spring.xml")
public class userServiceTest {
    @Autowired
    private userService userService;

    @Test
    public void getAllUserTest() {
        userService.getAllUser(1).getList().forEach(System.out::println);
    }

    @Test
    public void getAllUserBySearchTest() {
        userService.getAllUserBySearch(1,"135",null).getList().forEach(System.out::println);
    }

    @Test
    public void getUserByIdTest() {
        User user = userService.getUserById(38);
        System.out.println(user);
    }

    @Test
    public void loginTest() {
        System.out.println(userService.judgeLogin("4851321","451235648645", null));
    }

    @Test
    public void addUserTest() {
        userService.AddUser(new User());
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Test
    public void updateUserTest() {
        User user = userService.getUserById(142);
        user.setName("张琦");
        user.setPass("888888");
        user.setPhone("84581256");
        userService.UpdateUser(user);
        System.out.println("执行更新");
        System.out.println(userService.getUserById(142));
    }

    @Test
    public void deleteUserTest() {
        userService.DeleteUser(142);
    }
}
