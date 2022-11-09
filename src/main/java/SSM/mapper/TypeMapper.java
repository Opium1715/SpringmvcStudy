package SSM.mapper;

import SSM.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    Type selectByPrimaryKey(Integer id);

    List<Type> selectAll(@Param("typename") String typename);

    int updateByPrimaryKey(Type record);
}