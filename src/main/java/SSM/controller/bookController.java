package SSM.controller;

import SSM.pojo.Book;
import SSM.pojo.Type;
import SSM.service.bookService;
import SSM.service.fileService;
import SSM.service.typeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class bookController {
    @Autowired
    private bookService bookService;
    @Autowired
    private typeService typeService;

    @Autowired
    private fileService fileService;

    @GetMapping("/bookList")
    public ModelAndView BookDisplay(@RequestParam(defaultValue = "1")Integer PageNo){
        PageInfo<Book> bookPageInfo = bookService.getAllBook(PageNo);
        return new ModelAndView("booklist","pageInfo",bookPageInfo);
    }

    @GetMapping("/bookListSearch")
    public ModelAndView BookSearchDisplay(@RequestParam(defaultValue = "1")Integer PageNo,String bookName,
                                          String bookType){
        PageInfo<Book> bookPageInfo = bookService.getAllBookBySearch(PageNo,bookName,bookType);
        return new ModelAndView("booklist","pageInfo",bookPageInfo);
    }

    @PostMapping("/bookUpdate")
    public ModelAndView Update(MultipartFile image,Book book,HttpSession session) throws IOException {
        if(image!=null && !image.isEmpty()){
            try{
                String uploadPath = session.getServletContext().getRealPath("/static/upload") + File.separator + "book";
                String filename = fileService.fileUpload(uploadPath,image);
                book.setImageName(filename);
            }
            catch (Exception e){
                throw new RuntimeException("上传文件出错，请查看详情！");
            }
        }
        bookService.UpdateBook(book);
        return new ModelAndView("redirect:bookList");
    }

    @GetMapping("/bookEdit")
    public ModelAndView Edit(Integer id){
        Map<String,Object> map = new HashMap<>();
        List<Type> typeList = typeService.getAllType();
        Book book = bookService.getBookById(id);
        map.put("types",typeList);
        map.put("book",book);
        return new ModelAndView("bookedit",map);
    }

    @GetMapping("/bookAdd")
    public ModelAndView Create(){
        //获取所有类型的名称，以供复选框选择
        List<Type> typeList = typeService.getAllType();
        return new ModelAndView("bookadd","types",typeList);
    }

    @PostMapping("/bookSave")
    public ModelAndView Add(MultipartFile image, HttpSession session, Book book) throws IOException {
        //传入图片文件不为空执行上传操作
        if(image!=null){
            String uploadPath = session.getServletContext().getRealPath("/static/upload") + File.separator + "book";
            String filename =  fileService.fileUpload(uploadPath,image);
            book.setImageName(filename);
        }
        bookService.AddBook(book);
        return new ModelAndView("redirect:bookList");
    }

    @DeleteMapping("/bookDelete")
    public ModelAndView Delete(Integer id, HttpSession session){
        Book book = bookService.getBookById(id);
        String fileName = book.getImageName();
        if(fileName!=null){
            String uploadPath = session.getServletContext().getRealPath("/static/upload") + File.separator +"book";
            fileService.fileDelete(uploadPath,fileName);
        }
        bookService.DeleteBook(id);
        return new ModelAndView("redirect:bookList");
    }

}
