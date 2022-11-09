package SSM.mapper;

import SSM.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    List<Book> selectAll(@Param("name")String name,@Param("type")String type);

    int updateByPrimaryKey(Book record);
}