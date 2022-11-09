import SSM.pojo.Book;
import SSM.service.bookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.UUID;

@ContextConfiguration("classpath:Spring.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class bookServiceTest {
    @Autowired
    private SSM.service.bookService bookService;

    @Test
    public void getAllBookTest() {
        bookService.getAllBook(1).getList().forEach(System.out::println);
    }

    @Test
    public void getAllBookBySearchTest() {
        bookService.getAllBookBySearch(1,"人工智能",null).getList().forEach(System.out::println);
    }

    @Test
    public void getBookByIdTest() {
        System.out.println(bookService.getBookById(58));
    }

    @Test
    public void AddBookTest() {
        bookService.AddBook(new Book());
    }

    @Test
    public void UpdateBookTest() {
        Book book = bookService.getBookById(61);
        book.setId(62);
        book.setName("测试核心");
        book.setPdate(new Date());
        book.setIsbn(String.valueOf(UUID.randomUUID()));
        bookService.UpdateBook(book);
    }

    @Test
    public void DeleteBookTest() {
        bookService.DeleteBook(62);
    }
}
