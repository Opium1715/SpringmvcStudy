package SSM.mapper;

import SSM.pojo.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Borrow record);

    Borrow selectByPrimaryKey(Integer id);

    List<Borrow> selectAll(@Param("username") String username,@Param("bookName") String bookName);

    int updateByPrimaryKey(Borrow record);
}