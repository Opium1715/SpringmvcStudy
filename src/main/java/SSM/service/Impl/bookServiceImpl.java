package SSM.service.Impl;

import SSM.mapper.BookMapper;
import SSM.pojo.Book;
import SSM.service.bookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class bookServiceImpl implements bookService {
    @Autowired
    private BookMapper bookMapper;


    @Override
    public PageInfo<Book> getAllBook(Integer PageNo) {
        PageHelper.startPage(PageNo,8);
        List<Book> bookList = bookMapper.selectAll(null,null);
        return new PageInfo<>(bookList);
    }

    @Override
    public List<Book> getAllBook() {
        return bookMapper.selectAll(null,null);
    }

    @Override
    public PageInfo<Book> getAllBookBySearch(Integer PageNo, String bookName, String bookType) {
        PageHelper.startPage(PageNo,8);
        List<Book> bookList = bookMapper.selectAll(bookName,bookType);
        return new PageInfo<>(bookList);
    }

    @Override
    public void AddBook(Book book) {
        bookMapper.insert(book);
    }

    @Override
    public void DeleteBook(Integer id) {
        bookMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void UpdateBook(Book book) {
        bookMapper.updateByPrimaryKey(book);
    }

    @Override
    public Book getBookById(Integer id) {
        return bookMapper.selectByPrimaryKey(id);
    }
}
