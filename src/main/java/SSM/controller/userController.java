package SSM.controller;

import SSM.pojo.User;
import SSM.service.userService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller

public class userController {
    @Autowired
    private userService userService;

    @GetMapping("/userList")
    public ModelAndView Display(@RequestParam(defaultValue = "1") Integer PageNo ){
        PageInfo<User> userPageInfo = userService.getAllUser(PageNo);
        return new ModelAndView("userlist","pageInfo",userPageInfo);
    }

    @GetMapping("/userListSearch")
    public ModelAndView DisplaySearch(@RequestParam(defaultValue = "1") Integer PageNo,
                                       String phone,String username){
        PageInfo<User> userPageInfo = userService.getAllUserBySearch(PageNo,phone,username);
        return new ModelAndView("userlist","pageInfo",userPageInfo);
    }

    @PostMapping("/userLogin")
    public ModelAndView Login(String phone, String pass, HttpServletRequest request){
        if(userService.judgeLogin(phone, pass,request)){
            return new ModelAndView("redirect:userList");
        }
        else return new ModelAndView("singin","fail","账号或密码错误");
    }

    @PostMapping("/userUpdate")
    public ModelAndView Update(User user){
        userService.UpdateUser(user);
        return new ModelAndView("redirect:userList");
    }

    @GetMapping("/userEdit")
    public ModelAndView Edit(Integer id){
        User user = userService.getUserById(id);
        return new ModelAndView("useredit","user",user);
    }

    @GetMapping("/userAdd")
    public ModelAndView Create(){
        return new ModelAndView("useradd");
    }

    @PostMapping("/userSave")
    public ModelAndView Add(User user){
        userService.AddUser(user);
        return new ModelAndView("redirect:userList");
    }

    @GetMapping("/userDelete")
    public ModelAndView Delete(Integer id){
        userService.DeleteUser(id);
        return new ModelAndView("redirect:userList");
    }

    @GetMapping("/userLoginOut")
    public ModelAndView LoginOut(HttpServletRequest request){
        request.getSession().setAttribute("admin",null);
        return new ModelAndView("singin");
    }

    @GetMapping("/pwEdit")
    public ModelAndView PassWordEdit(HttpSession session){
        User user = (User) session.getAttribute("admin");
        return new ModelAndView("pwedit","user",user);
    }

}
