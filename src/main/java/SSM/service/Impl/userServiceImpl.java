package SSM.service.Impl;

import SSM.mapper.UserMapper;
import SSM.pojo.User;
import SSM.service.userService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Service
public class userServiceImpl implements userService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> getAllUser(Integer PageNo) {
//        开启分页查询，设置起始页和每页条数
        PageHelper.startPage(PageNo,13);
        List<User> userList = userMapper.selectAll(null,null);
        return new PageInfo<>(userList);

    }

    @Override
    public PageInfo<User> getAllUserBySearch(Integer PageNo, String phone, String username){
        PageHelper.startPage(PageNo,13);
        List<User> userList = userMapper.selectAll(phone,username);
        return new PageInfo<>(userList);
    }

    @Override
    public boolean judgeLogin(String phone, String pass, HttpServletRequest request){
        User user = userMapper.selectByPhone(phone);
        if(user!=null){
            if(user.getPass().equals(pass)){
                request.getSession().setAttribute("admin",user);
                return true;
            }
        }
        return false;
    }

    @Override
    public void AddUser(User user) {
        userMapper.insert(user);
    }

    @Override
    public void DeleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void UpdateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }
}
