package SSM.service;

import SSM.mapper.BookMapper;
import SSM.pojo.Book;
import SSM.pojo.Book;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface bookService {

    PageInfo<Book> getAllBook(Integer PageNo);

    List<Book> getAllBook();

    PageInfo<Book> getAllBookBySearch(Integer PageNo, String bookName, String bookType);


    void AddBook(Book book);

    void DeleteBook(Integer id);

    void UpdateBook(Book book);

    Book getBookById(Integer id);

}
