
import SSM.mapper.*;
import SSM.pojo.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.sql.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:Spring.xml")
public class sqltest {
    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private TypeMapper typeMapper;
   @Test
    public void sql(){
       File file = new File("C:\\Users\\ZhangQi\\Desktop\\图书");
       String[] strings = file.list();
       assert strings != null;
       int i = 12;
       while (i<=53){
          String s = strings[i%8];
               System.out.println(s);
               Book book = bookMapper.selectByPrimaryKey(i);
               book.setImageName(s);
               bookMapper.updateByPrimaryKey(book);
               i++;
       }

    }
}
