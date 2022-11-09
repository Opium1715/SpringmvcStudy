package SSM.mapper;

import SSM.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll(@Param("phone") String phone, @Param("name") String name);

    int updateByPrimaryKey(User record);

    User selectByPhone(String phone);
}