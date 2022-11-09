package SSM.service;

import SSM.pojo.User;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface userService {
    PageInfo<User> getAllUser(Integer PageNo);

    PageInfo<User> getAllUserBySearch(Integer PageNo, String phone, String username);

    boolean judgeLogin(String phone, String pass, HttpServletRequest request);

    void AddUser(User user);

    void DeleteUser(Integer id);

    void UpdateUser(User user);

    User getUserById(Integer id);
}
