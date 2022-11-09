import SSM.pojo.Type;
import SSM.service.typeService;
import SSM.service.userService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:Spring.xml")
public class typeServiceTest {
    @Autowired
    private typeService typeService;

    @Test
    public void getAllTypeTest() {
        typeService.getAllType().forEach(System.out::println);
    }

    @Test
    public void getAllTypeByPageTest() {
        typeService.getAllType(1).getList().forEach(System.out::println);
    }

    @Test
    public void getAllTypeBySearch() {
        typeService.getAllTypeBySearch(1,"手").getList().forEach(System.out::println);
    }

    @Test
    public void getTypeByIdTest() {
        System.out.println(typeService.getTypeById(2));
    }

    @Test
    public void AddTypeTest() {
        typeService.AddType(new Type());
    }

    @Test
    public void UpdateTypeTest() {
        Type type = typeService.getTypeById(14);
        type.setTypename("科幻");
        typeService.UpdateType(type);
    }

    @Test
    public void DeleteTypeTest() {
        typeService.DeleteType(14);
    }
}
